class ConvertImagesController < ApplicationController

  before_action :set_convert_image, only: [:show]
  before_action :set_session, only: [:index]

  # GET /convert_images
  # GET /convert_images.json
  def index
    @convert_image = ConvertImage.new
  end

  # GET /convert_images/1
  # GET /convert_images/1.json
  def show
  end

  # POST /convert_images
  # POST /convert_images.json
  def create
    @convert_image = ConvertImage.new(convert_image_params)
    @new_access_key = SecureRandom.uuid
    unless @convert_image.data.nil?
      if @convert_image.save
        @new_access_key = SecureRandom.uuid
        @convert_image.access_key = @new_access_key
        session[:id] = @new_access_key
        @convert_image.save
        redirect_to @convert_image
      else
        redirect_to convert_images_path, notice: "Filetypes allowed: jpg, jpeg, gif, png. Maximum filesize allowed: 5 MB."
      end
    else
      redirect_to convert_images_path, notice: "Error. Please try again!"
    end
  end

  private
    def set_session
      unless session[:id].nil?
        @current_session = ConvertImage.find_by(access_key: session[:id])
        unless @current_session.nil?
          if Time.now > @current_session.created_at + 1.hour
            session.delete(:id)
            @current_session = nil
          end
        end
      end
    end

    def set_convert_image
      unless session[:id].nil?
        @convert_image = ConvertImage.find(params[:id])
        if @convert_image.access_key != session[:id]
          session.delete(:id)
          redirect_to convert_images_path, notice: "Invalid session! Please select an image to edit and try again."
        elsif Time.now > @convert_image.created_at + 1.hour
          session.delete(:id)
          redirect_to convert_images_path, notice: "Session expired! Please select an image to edit."
        end
      else
        redirect_to convert_images_path # THIS IS AN INVALID REQUEST, MOSTLY MALFORMED OR EXPIRED LINK GET DUE TO WEB CACHE OF USER
      end
    end

    def convert_image_params
        unless params[:convert_image].nil?
          params.require(:convert_image).permit(:data)
        end
    end
end

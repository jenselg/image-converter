class ImagesController < ApplicationController
  before_action :set_image, only: [:show]
  before_action :set_session, only: [:index]

  def index
    @image = Image.new
  end

  def show
    @facebook = [
      {id: 'facebook_1', name: 'Profile Picture', width: '320', height: '320', scale: '1'},
      {id: 'facebook_2', name: 'Cover Photo', width: '828', height: '315', scale: '3'},
      {id: 'facebook_3', name: 'Event Image', width: '1920', height: '1080', scale: '6'},
      {id: 'facebook_4', name: 'Shared Image', width: '1200', height: '900', scale: '4'},
      {id: 'facebook_5', name: 'Shared Link', width: '1200', height: '628', scale: '4'},
      {id: 'facebook_6', name: 'Open Graph (OG) Image', width: '1200', height: '630', scale: '4'}
    ]
    @twitter = [
      {id: 'twitter_1', name: 'Profile Photo', width: '400', height: '400', scale: '2'},
      {id: 'twitter_2', name: 'Header Photo', width: '1500', height: '500', scale: '5'},
      {id: 'twitter_3', name: 'Picture in Tweet', width: '1024', height: '512', scale: '3'},
      {id: 'twitter_4', name: 'Displays in Timeline', width: '506', height: '253', scale: '2'}
    ]
    @google = [
      {id: 'google_1', name: 'Profile Photo', width: '250', height: '250', scale: '1'},
      {id: 'google_2', name: 'Cover Photo', width: '1080', height: '608', scale: '4'},
      {id: 'google_3', name: 'Shared Image', width: '506', height: '506', scale: '2'},
      {id: 'google_4', name: 'Shared link image thumbnail', width: '150', height: '150', scale: '.5'}
    ]
    @instagram = [
      {id: 'instagram_1', name: 'Profile Picture', width: '150', height: '150', scale: '.5'},
      {id: 'instagram_2', name: 'Shared Image Size', width: '1080', height: '1080', scale: '4'}
    ]
    @pinterest = [
      {id: 'pinterest_1', name: 'Profile Image', width: '180', height: '180', scale: '1'},
      {id: 'pinterest_2', name: 'Board Cover Image', width: '214', height: '100', scale: '2'},
      {id: 'pinterest_3', name: 'Boards - Large Thumbnail', width: '222', height: '150', scale: '1'},
      {id: 'pinterest_4', name: 'Boards - Small Thumbnail', width: '55', height: '55', scale: '.5'},
      {id: 'pinterest_5', name: 'Pins - Pin Image Preview', width: '238', height: '238', scale: '1'},
      {id: 'pinterest_6', name: 'Pins - Expanded Pin Max', width: '736', height: '736', scale: '3'}
    ]
    @linkedin = [
      {id: 'linkedin_1', name: 'Profile Photo', width: '400', height: '400', scale: '2'},
      {id: 'linkedin_2', name: 'Background Photo (Personal Profile)', width: '1536', height: '768', scale: '5'},
      {id: 'linkedin_3', name: 'Banner Image', width: '1850', height: '200', scale: '6'},
      {id: 'linkedin_4', name: 'Business Logo', width: '400', height: '400', scale: '2'},
      {id: 'linkedin_5', name: 'Company/Careers Cover Photo', width: '1536', height: '768', scale: '5'},
      {id: 'linkedin_6', name: 'Shared Image', width: '1200', height: '630', scale: '4'},
      {id: 'linkedin_7', name: 'Open Graph (OG) Image', width: '1200', height: '630', scale: '4'}
    ]
    @youtube = [
      {id: 'youtube_1', name: 'Channel Icon', width: '800', height: '800', scale: '3'},
      {id: 'youtube_2', name: 'Channel Banner Photo', width: '2560', height: '1440', scale: '8'},
      {id: 'youtube_3', name: 'TV Display', width: '2560', height: '1440', scale: '8'},
      {id: 'youtube_4', name: 'Desktop Display', width: '2560', height: '423', scale: '8'},
      {id: 'youtube_5', name: 'Tablet Display', width: '1855', height: '423', scale: '6'},
      {id: 'youtube_6', name: 'Mobile Display', width: '1546', height: '423', scale: '5'},
      {id: 'youtube_7', name: 'Uploaded Video Thumbnail', width: '2560', height: '1440', scale: '8'}
    ]
    @snapchat = [

    ]
    @twitch = [

    ]
    @web_banners = [
      {id: 'web_banners_1', name: 'Full Banner', width: '468', height: '60', scale: '2'},
      {id: 'web_banners_2', name: 'Leaderboard', width: '728', height: '90', scale: '3'},
      {id: 'web_banners_3', name: 'Square', width: '336', height: '280', scale: '1'},
      {id: 'web_banners_4', name: 'Square', width: '300', height: '250', scale: '1'},
      {id: 'web_banners_5', name: 'Square', width: '250', height: '250', scale: '1'},
      {id: 'web_banners_6', name: 'Skyscraper', width: '160', height: '600', scale: '1'},
      {id: 'web_banners_7', name: 'Skyscraper', width: '120', height: '600', scale: '1'},
      {id: 'web_banners_8', name: 'Small Skyscraper', width: '120', height: '240', scale: '1'},
      {id: 'web_banners_9', name: 'Fat Skyscraper', width: '240', height: '400', scale: '1'},
      {id: 'web_banners_10', name: 'Half Banner', width: '234', height: '60', scale: '1'},
      {id: 'web_banners_11', name: 'Rectangle', width: '180', height: '150', scale: '1'},
      {id: 'web_banners_12', name: 'Square Button', width: '125', height: '125', scale: '.5'},
      {id: 'web_banners_13', name: 'Button', width: '120', height: '90', scale: '.5'},
      {id: 'web_banners_14', name: 'Button', width: '120', height: '60', scale: '.5'},
      {id: 'web_banners_15', name: 'Button', width: '88', height: '31', scale: '.5'},
      {id: 'web_banners_16', name: 'Button', width: '120', height: '30', scale: '.5'},
      {id: 'web_banners_17', name: 'Small Banner', width: '230', height: '33', scale: '1'},
      {id: 'web_banners_18', name: 'Large Leaderboard', width: '728', height: '210', scale: '3'},
      {id: 'web_banners_19', name: 'Large Leaderboard', width: '720', height: '300', scale: '3'},
      {id: 'web_banners_20', name: 'Pop-up', width: '500', height: '350', scale: '2'},
      {id: 'web_banners_21', name: 'Pop-up', width: '550', height: '480', scale: '2'},
      {id: 'web_banners_22', name: 'Half Page Banner', width: '300', height: '600', scale: '1'},
      {id: 'web_banners_23', name: 'Blog Button', width: '94', height: '15', scale: '.3'}
    ]
    @print_media = [

    ]
  end

  def create
    @image = Image.new(image_params)
    @new_access_key = SecureRandom.uuid

    unless @image.data.nil?
      if @image.save
        @new_access_key = SecureRandom.uuid
        @image.access_key = @new_access_key
        session[:id] = @new_access_key
        @image.save
        redirect_to @image
      else
        redirect_to root_path, notice: "Cannot proceed to next step. Please see guidelines for accepted images!"
      end
    else
      redirect_to root_path, notice: "Error. Please try again!"
    end

  end

  private

    def set_session
      unless session[:id].nil?
        @current_session = Image.find_by(access_key: session[:id])
        unless @current_session.nil?
          if Time.now > @current_session.created_at + 3.hours
            session.delete(:id)
            @current_session = nil
          end
        end
      end
    end

    def set_image
      unless session[:id].nil?
        @image = Image.find(params[:id])
        if @image.access_key != session[:id]
          session.delete(:id)
          redirect_to root_path, notice: "Invalid session! Please select an image to edit and try again."
        elsif Time.now > @image.created_at + 3.hours
          session.delete(:id)
          redirect_to root_path, notice: "Session expired! Please select an image to edit."
        end
      else
        redirect_to root_path # THIS IS AN INVALID REQUEST, MOSTLY MALFORMED OR EXPIRED LINK GET DUE TO WEB CACHE OF USER
      end
    end

    def image_params
      unless params[:image].nil?
        params.require(:image).permit(:data)
      end
    end

end

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
      {id: 'instagram_1', name: 'Profile Picture', width: '1080', height: '1080', scale: '4'},
      {id: 'instagram_2', name: 'Square Image', width: '1080', height: '1080', scale: '4'},
      {id: 'instagram_3', name: 'Vertical Image', width: '1080', height: '1350', scale: '4'},
      {id: 'instagram_4', name: 'Horizontal Image', width: '1080', height: '566', scale: '4'},
      {id: 'instagram_5', name: 'Shared Image Size', width: '1080', height: '1080', scale: '4'}
    ]
    @pinterest = [
      {id: 'pinterest_1', name: 'Profile Image', width: '180', height: '180', scale: '.8'},
      {id: 'pinterest_2', name: 'Board Cover Image', width: '214', height: '100', scale: '.8'},
      {id: 'pinterest_3', name: 'Boards - Large Thumbnail', width: '222', height: '150', scale: '1'},
      {id: 'pinterest_4', name: 'Boards - Small Thumbnail', width: '55', height: '55', scale: '.2'},
      {id: 'pinterest_5', name: 'Pins - Pin Image Preview', width: '238', height: '238', scale: '.8'},
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
      {id: 'snapchat_1', name: 'Geofilter', width: '1080', height: '1920', scale: '4'}
    ]
    @twitch = [
      {id: 'twitch_1', name: 'Profile Picture - Standard', width: '800', height: '800', scale: '3'},
      {id: 'twitch_2', name: 'Profile Picture - Full HD', width: '1600', height: '1600', scale: '5'},
      {id: 'twitch_3', name: 'Profile Banner', width: '1920', height: '480', scale: '6'},
      {id: 'twitch_4', name: 'Video Player Banner', width: '1920', height: '1080', scale: '6'},
      {id: 'twitch_5', name: 'Panels - Standard', width: '320', height: '320', scale: '1'},
      {id: 'twitch_6', name: 'Panels - Full HD', width: '640', height: '640', scale: '2'},
      {id: 'twitch_7', name: 'Overlay - Type 1', width: '1920', height: '1080', scale: '6'},
      {id: 'twitch_8', name: 'Overlay - Type 2', width: '1280', height: '720', scale: '4'},
      {id: 'twitch_9', name: 'Web Cam Slot', width: '1280', height: '720', scale: '4'}
    ]
    @tumblr = [
      {id: 'tumblr_1', name: 'Photo Post - Standard', width: '540', height: '810', scale: '2'},
      {id: 'tumblr_2', name: 'Photo Post - High Res', width: '1280', height: '1920', scale: '4'},
      {id: 'tumblr_3', name: 'Tall Photo Post', width: '710', height: '1920', scale: '3'},
      {id: 'tumblr_4', name: 'Photoset - 1 Image (Square)', width: '540', height: '540', scale: '2'},
      {id: 'tumblr_5', name: 'Photoset - 2 Image (Square)', width: '268', height: '268', scale: '1'},
      {id: 'tumblr_6', name: 'Photoset - 3 Image (Square)', width: '177', height: '177', scale: '.8'},
      {id: 'tumblr_7', name: 'Audio Post', width: '169', height: '169', scale: '.8'},
      {id: 'tumblr_8', name: 'Link Post (Square)', width: '540', height: '540', scale: '2'},
      {id: 'tumblr_9', name: 'Text Post (Square)', width: '540', height: '540', scale: '2'},
      {id: 'tumblr_10', name: 'Avatar', width: '64', height: '64', scale: '.2'}
    ]
    @vk = [
      {id: 'vk_1', name: 'Cover Image - Business Page', width: '1590', height: '400', scale: '5'},
      {id: 'vk_2', name: 'Profile Photo - Business Page', width: '200', height: '500', scale: '1'},
      {id: 'vk_3', name: 'Post Image', width: '510', height: '510', scale: '2'},
      {id: 'vk_4', name: 'Post Link', width: '510', height: '308', scale: '2'}
    ]
    @ok = [
      {id: 'ok_1', name: 'Profile Photo - Business Page', width: '288', height: '288', scale: '1'},
      {id: 'ok_2', name: 'Post Image - Business Page', width: '546', height: '546', scale: '2'},
      {id: 'ok_3', name: 'Post Link - Business Page', width: '546', height: '272', scale: '2'}
    ]
    @web_banners = [
      {id: 'web_banners_1', name: 'Full Banner', width: '468', height: '60', scale: '1.5'},
      {id: 'web_banners_2', name: 'Leaderboard', width: '728', height: '90', scale: '2.5'},
      {id: 'web_banners_3', name: 'Square', width: '336', height: '280', scale: '1'},
      {id: 'web_banners_4', name: 'Square', width: '300', height: '250', scale: '1'},
      {id: 'web_banners_5', name: 'Square', width: '250', height: '250', scale: '1'},
      {id: 'web_banners_6', name: 'Skyscraper', width: '160', height: '600', scale: '.5'},
      {id: 'web_banners_7', name: 'Skyscraper', width: '120', height: '600', scale: '.5'},
      {id: 'web_banners_8', name: 'Small Skyscraper', width: '120', height: '240', scale: '.5'},
      {id: 'web_banners_9', name: 'Fat Skyscraper', width: '240', height: '400', scale: '1'},
      {id: 'web_banners_10', name: 'Half Banner', width: '234', height: '60', scale: '1'},
      {id: 'web_banners_11', name: 'Rectangle', width: '180', height: '150', scale: '.6'},
      {id: 'web_banners_12', name: 'Square Button', width: '125', height: '125', scale: '.5'},
      {id: 'web_banners_13', name: 'Button', width: '120', height: '90', scale: '.5'},
      {id: 'web_banners_14', name: 'Button', width: '120', height: '60', scale: '.5'},
      {id: 'web_banners_15', name: 'Button', width: '88', height: '31', scale: '.3'},
      {id: 'web_banners_16', name: 'Button', width: '120', height: '30', scale: '.5'},
      {id: 'web_banners_17', name: 'Small Banner', width: '230', height: '33', scale: '.8'},
      {id: 'web_banners_18', name: 'Large Leaderboard', width: '728', height: '210', scale: '3'},
      {id: 'web_banners_19', name: 'Large Leaderboard', width: '720', height: '300', scale: '3'},
      {id: 'web_banners_20', name: 'Pop-up', width: '500', height: '350', scale: '2'},
      {id: 'web_banners_21', name: 'Pop-up', width: '550', height: '480', scale: '2'},
      {id: 'web_banners_22', name: 'Half Page Banner', width: '300', height: '600', scale: '1'},
      {id: 'web_banners_23', name: 'Blog Button', width: '94', height: '15', scale: '.3'}
    ]
    @print_media = [
      {id: 'print_media_1', name: 'Business Card - Horizontal', width: '1050', height: '600', scale: '3.5'},
      {id: 'print_media_2', name: 'Business Card - Vertical', width: '600', height: '1050', scale: '2'},
      {id: 'print_media_3', name: '4x6 Prints', width: '540', height: '360', scale: '2'},
      {id: 'print_media_4', name: '5x7 Prints', width: '630', height: '450', scale: '2'},
      {id: 'print_media_5', name: '8x10 Prints', width: '900', height: '720', scale: '3'},
      {id: 'print_media_6', name: 'Wallet Prints', width: '270', height: '180', scale: '1'},
      {id: 'print_media_7', name: '11x14 Posters', width: '1008', height: '792', scale: '3'},
      {id: 'print_media_12', name: '2x6 Banner', width: '1800', height: '1440', scale: '6'},
      {id: 'print_media_13', name: '2x8 Banner', width: '1800', height: '1440', scale: '6'},
      {id: 'print_media_14', name: '4x8 Photo Cards', width: '640', height: '426', scale: '2'},
      {id: 'print_media_15', name: '5x7 Photo Cards', width: '640', height: '480', scale: '2'},
      {id: 'print_media_16', name: '5x7 Folded Cards', width: '640', height: '600', scale: '2'},
      {id: 'print_media_17', name: '4.25x6 Postcards', width: '720', height: '480', scale: '3'},
      {id: 'print_media_18', name: '5x7 Postcards', width: '840', height: '600', scale: '3'},
      {id: 'print_media_19', name: 'Passport Photo - 2x2 inches', width: '600', height: '600', scale: '2'},
      {id: 'print_media_20', name: 'Passport Photo - 1.5x1.5 inches', width: '450', height: '450', scale: '2'},
      {id: 'print_media_21', name: 'Passport Photo - 1.38x1.77 inches', width: '413', height: '531', scale: '2'},
      {id: 'print_media_22', name: 'Passport Photo - 1.38x1.38 inches', width: '413', height: '413', scale: '2'},
      {id: 'print_media_23', name: 'Passport Photo - 1.18x1.57 inches', width: '354', height: '472', scale: '2'},
      {id: 'print_media_24', name: 'Passport Photo - 1.97x2.76 inches', width: '591', height: '827', scale: '2'},
      {id: 'print_media_25', name: 'Passport Photo - 1.30x1.89 inches', width: '390', height: '567', scale: '2'}
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

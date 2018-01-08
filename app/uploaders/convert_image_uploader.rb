class ConvertImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  
    # Choose what kind of storage to use for this uploader:
    storage :file
    # storage :fog
  
    # Override the directory where uploaded files will be stored.
    # This is a sensible default for uploaders that are meant to be mounted:
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
  
    # Provide a default URL as a default if there hasn't been a file uploaded:
    # def default_url(*args)
    #   # For Rails 3.1+ asset pipeline compatibility:
    #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
    #
    #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
    # end
  
    # Process files as they are uploaded:
    # process scale: [200, 300]
    #
    # def scale(width, height)
    #   # do something
    # end
  
    # Create different versions of your uploaded files:
    # version :thumbnail do
    #   process resize_to_fit: [250, 250]
    # end

    version :jpg do
      process convert: 'jpg'
      def full_filename (for_file = file) 
        "#{for_file}.jpg" 
      end 
    end

    version :gif do
      process convert: 'gif'
      def full_filename (for_file = file) 
        "#{for_file}.gif" 
      end 
    end

    version :png do
      process convert: 'png'
      def full_filename (for_file = file) 
        "#{for_file}.png" 
      end 
    end

    version :tif do
      process convert: 'tif'
      def full_filename (for_file = file)
        "#{for_file}.tif" 
      end 
    end

    version :svg do
      process convert: 'svg'
      def full_filename (for_file = file)
        "#{for_file}.svg" 
      end 
    end

    # Add a white list of extensions which are allowed to be uploaded.
    # For images you might use something like this:
     def extension_whitelist
       %w(jpg jpeg gif png tif tiff svg)
     end
  
    # Override the filename of the uploaded files:
    # Avoid using model.id or version_name here, see uploader/store.rb for details.
    # def filename
    #   "something.jpg" if original_filename
    # end
  
    def size_range
      1..5.megabytes
    end
  
    def filename
      "ALLPIC.SITE-#{secure_token}" if original_filename.present?
    end
  
    protected
  
    def secure_token
      var = :"@#{mounted_as}_secure_token"
      model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
    end
  
end

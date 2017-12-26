class Image < ApplicationRecord
    mount_uploader :data, ImageUploader

    validates :data, presence: true
    validate :validate_image
    
    private

    def validate_image
      unless data.path.nil?
        image = MiniMagick::Image.open(data.path)
        unless image[:width] > 10 && image[:height] > 10
          errors.add :image, "should be 10x10 pixels minimum!" 
        end
      else
          errors.add :image, "is an invalid image!" 
      end
    end

end

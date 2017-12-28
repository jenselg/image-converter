class Image < ApplicationRecord
    mount_uploader :data, ImageUploader
    validates :data, presence: true
    
    private

end

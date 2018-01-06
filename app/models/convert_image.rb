class ConvertImage < ApplicationRecord
    mount_uploader :data, ConvertImageUploader
    validates :data, presence: true
end

json.extract! convert_image, :id, :data, :access_key, :created_at, :updated_at
json.url convert_image_url(convert_image, format: :json)

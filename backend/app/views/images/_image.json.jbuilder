json.extract! image, :id, :category, :filename, :description, :created_at, :updated_at
json.url image_url(image, format: :json)
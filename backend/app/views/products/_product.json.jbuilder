json.extract! product, :id, :name, :upc_code, :product_code, :sell_by_date, :image_id_id, :created_at, :updated_at
json.url product_url(product, format: :json)
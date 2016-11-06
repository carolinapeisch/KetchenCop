json.extract! user, :id, :contact_id, :created_at, :updated_at
json.url user_url(user, format: :json)
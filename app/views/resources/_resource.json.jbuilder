json.extract! resource, :id, :tittle, :reason, :price, :created_at, :updated_at
json.url resource_url(resource, format: :json)
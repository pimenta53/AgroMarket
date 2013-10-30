json.array!(@price_types) do |price_type|
  json.extract! price_type, :name
  json.url price_type_url(price_type, format: :json)
end

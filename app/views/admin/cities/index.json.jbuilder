json.array!(@admin_cities) do |admin_city|
  json.extract! admin_city, :id
  json.url admin_city_url(admin_city, format: :json)
end

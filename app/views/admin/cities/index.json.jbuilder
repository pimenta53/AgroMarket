json.array!(@cities) do |city|
  json.extract! city, :city, :country_id
  json.url city_url(city, format: :json)
end

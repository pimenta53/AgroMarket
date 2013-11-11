json.array!(@ads) do |ad|
  json.extract! ad, :title, :description, :price, :expire_date, :location, :is_active, :type_price_id, :city_id
  json.url ad_url(ad, format: :json)
end

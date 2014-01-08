json.array!(@plams) do |plam|
  json.extract! plam, :id, :name, :duration, :price, :ads_limit, :event_limit
  json.url plam_url(plam, format: :json)
end

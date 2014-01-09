json.array!(@plans) do |plan|
  json.extract! plan, :id, :name, :duration, :price, :ads_limit, :event_limit
  json.url plan_url(plan, format: :json)
end

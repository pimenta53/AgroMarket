json.array!(@types) do |type|
  json.extract! type, :name, :flag
  json.url type_url(type, format: :json)
end

json.array!(@admin_publicities) do |admin_publicity|
  json.extract! admin_publicity, :title, :description, :expire_date, :owner, :is_deleted
  json.url admin_publicity_url(admin_publicity, format: :json)
end

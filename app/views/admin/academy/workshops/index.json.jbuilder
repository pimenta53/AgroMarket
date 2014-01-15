json.array!(@admin_academy_workshops) do |admin_academy_workshop|
  json.extract! admin_academy_workshop, :id
  json.url admin_academy_workshop_url(admin_academy_workshop, format: :json)
end

json.array!(@academy_workshops) do |academy_workshop|
  json.extract! academy_workshop, :user_id, :available_slots, :slots_taken, :price, :local, :date, :description, :is_delected, :requires_registration
  json.url academy_workshop_url(academy_workshop, format: :json)
end

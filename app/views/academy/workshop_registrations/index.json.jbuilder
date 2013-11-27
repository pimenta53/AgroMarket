json.array!(@academy_workshop_registrations) do |academy_workshop_registration|
  json.extract! academy_workshop_registration, :workshop_id, :user_id, :is_deleted
  json.url academy_workshop_registration_url(academy_workshop_registration, format: :json)
end

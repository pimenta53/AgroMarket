json.array!(@contacts) do |contact|
  json.extract! contact, :name, :email, :subject, :text
  json.url contact_url(contact, format: :json)
end
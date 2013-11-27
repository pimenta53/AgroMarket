json.array!(@academy_tutorial_images) do |academy_tutorial_image|
  json.extract! academy_tutorial_image, :tutorial_id, :url, :is_deleted
  json.url academy_tutorial_image_url(academy_tutorial_image, format: :json)
end

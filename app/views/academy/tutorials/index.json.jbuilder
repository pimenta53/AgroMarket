json.array!(@academy_tutorials) do |academy_tutorial|
  json.extract! academy_tutorial, :category_id, :user_id, :aproved, :title, :text, :is_delected
  json.url academy_tutorial_url(academy_tutorial, format: :json)
end

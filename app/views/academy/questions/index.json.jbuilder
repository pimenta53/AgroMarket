json.array!(@academy_questions) do |academy_question|
  json.extract! academy_question, :user_id, :category_id, :title, :text, :is_deleted, :image_url
  json.url academy_question_url(academy_question, format: :json)
end

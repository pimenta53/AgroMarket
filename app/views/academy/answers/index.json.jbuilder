json.array!(@academy_answers) do |academy_answer|
  json.extract! academy_answer, :question_id, :user_id, :up, :down, :is_deleted, :image_url, :text
  json.url academy_answer_url(academy_answer, format: :json)
end

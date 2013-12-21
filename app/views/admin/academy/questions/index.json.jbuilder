json.array!(@admin_academy_questions) do |admin_academy_question|
  json.extract! admin_academy_question, 
  json.url admin_academy_question_url(admin_academy_question, format: :json)
end

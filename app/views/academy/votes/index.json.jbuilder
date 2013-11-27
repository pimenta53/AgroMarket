json.array!(@academy_votes) do |academy_vote|
  json.extract! academy_vote, :vote, :user_id, :answer_id
  json.url academy_vote_url(academy_vote, format: :json)
end

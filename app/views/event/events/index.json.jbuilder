json.array!(@event_events) do |event_event|
  json.extract! event_event, :start_day, :end_day, :title, :description, :user_id, :aproved
  json.url event_event_url(event_event, format: :json)
end

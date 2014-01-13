json.array!(@admin_plans) do |admin_plan|
  json.extract! admin_plan, :id
  json.url admin_plan_url(admin_plan, format: :json)
end

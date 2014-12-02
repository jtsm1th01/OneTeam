json.array!(@users) do |user|
  json.extract! user, :id, :user_name, :user_email, :years_with_company, :user_id, :position_id, :group_id, :location_id
  json.url user_url(user, format: :json)
end

json.array!(@users) do |user|
  json.extract! user, :id, :UserName, :UserEmail
  json.url user_url(user, format: :json)
end

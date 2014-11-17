json.array!(@skills) do |skill|
  json.extract! skill, :id, :skill_name
  json.url skill_url(skill, format: :json)
end

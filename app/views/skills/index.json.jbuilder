json.array!(@skills) do |skill|
  json.extract! skill, :id, :SkillName
  json.url skill_url(skill, format: :json)
end

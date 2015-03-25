json.array!(@reviews) do |review|
  json.extract! review, :id, :assignment_id, :skill_id, :experience, :skill_level
  json.url review_url(review, format: :json)
end

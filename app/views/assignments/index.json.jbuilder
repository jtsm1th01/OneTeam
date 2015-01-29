json.array!(@assignments) do |assignment|
  json.extract! assignment, :id, :employee_id, :project_request_id
  json.url assignment_url(assignment, format: :json)
end

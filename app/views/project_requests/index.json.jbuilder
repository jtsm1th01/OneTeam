json.array!(@project_requests) do |project_request|
  json.extract! project_request, :id, :project_id, :user_id, :department_id, :group_id, :location_id, :skill_id
  json.url project_request_url(project_request, format: :json)
end

json.array!(@project_requests) do |project_request|
  json.extract! project_request, :id, :project_id, :contact_id, :department_id, :location_id, :project_start, :project_end, :skill_id
  json.url project_request_url(project_request, format: :json)
end

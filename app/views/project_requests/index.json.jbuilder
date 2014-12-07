json.array!(@project_requests) do |project_request|
  json.extract! project_request, :id, :project_id, :description
  json.url project_request_url(project_request, format: :json)
end

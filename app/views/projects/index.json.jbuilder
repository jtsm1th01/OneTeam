json.array!(@projects) do |project|
  json.extract! project, :id, :project_name, :contact, :project_start, :project_end
  json.url project_url(project, format: :json)
end

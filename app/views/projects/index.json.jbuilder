json.array!(@projects) do |project|
  json.extract! project, :id, :ProjName, :Contact, :ProjStart, :ProjEnd
  json.url project_url(project, format: :json)
end

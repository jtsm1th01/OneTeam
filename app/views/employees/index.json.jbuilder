json.array!(@employees) do |employee|
  json.extract! employee, :id, :employee_name, :employee_email, :years_with_company, :employee_id, :position_id, :group_id, :location_id
  json.url employee_url(employee, format: :json)
end

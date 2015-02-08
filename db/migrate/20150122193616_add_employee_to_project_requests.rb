class AddEmployeeToProjectRequests < ActiveRecord::Migration
  def change
    add_column :project_requests, :employee_id, :integer
  end
end

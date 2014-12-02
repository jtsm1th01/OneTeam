class UpdateEmployeeColumnsInEmpTable < ActiveRecord::Migration
  def change
    rename_column :employees, :user_name, :employee_name
    rename_column :employees, :user_email, :employee_email
    rename_column :employees, :user_id, :employee_id
    rename_column :project_requests, :user_id, :employee_id
    rename_column :skills_users, :user_id, :employee_id 
  end
end

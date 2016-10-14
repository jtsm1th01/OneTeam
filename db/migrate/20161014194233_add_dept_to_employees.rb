class AddDeptToEmployees < ActiveRecord::Migration
  def change
    rename_column :employees, :group_id, :department_id
  end
end

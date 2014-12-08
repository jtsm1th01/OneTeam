class RemoveGroupAndLeadFromProjReq < ActiveRecord::Migration
  def change
    remove_column :project_requests, :employee_id
    remove_column :project_requests, :group_id
  end
end

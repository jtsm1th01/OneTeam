class RemoveDeptIdFromProjReqTable < ActiveRecord::Migration
  def change
    remove_column :project_requests, :department_id
  end
end

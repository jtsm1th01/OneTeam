class AssociateGroupWithPrjreqs < ActiveRecord::Migration
  def change
    add_column :project_requests, :group_id, :integer
  end
end

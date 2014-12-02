class RemoveProjectEndFromProjectRequests < ActiveRecord::Migration
  def change
    remove_column :project_requests, :project_end
  end
end

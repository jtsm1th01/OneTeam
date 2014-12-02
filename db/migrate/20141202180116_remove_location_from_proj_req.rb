class RemoveLocationFromProjReq < ActiveRecord::Migration
  def change
    remove_column :project_requests, :location_id
  end
end

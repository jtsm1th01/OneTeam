class AddDescToProjReq < ActiveRecord::Migration
  def change
    add_column :project_requests, :description, :text
  end
end

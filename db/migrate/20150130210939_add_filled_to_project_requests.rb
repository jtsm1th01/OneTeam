class AddFilledToProjectRequests < ActiveRecord::Migration
  def change
    add_column :project_requests, :filled, :boolean, :default => false
  end
end

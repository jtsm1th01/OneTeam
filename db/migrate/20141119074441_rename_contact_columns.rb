class RenameContactColumns < ActiveRecord::Migration
  def change
    rename_column :projects, :contact, :user_id
    rename_column :project_requests, :contact_id, :user_id
  end
end

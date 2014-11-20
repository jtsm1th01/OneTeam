class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_id, :integer
    add_column :users, :title_id, :integer
    add_column :users, :department_id, :integer
    add_column :users, :group_id, :integer
    add_column :users, :location_id, :integer
    add_column :users, :skill_id, :integer
  end
end

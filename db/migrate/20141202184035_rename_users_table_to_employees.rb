class RenameUsersTableToEmployees < ActiveRecord::Migration
  def change
    rename_table :users, :employees
  end
end

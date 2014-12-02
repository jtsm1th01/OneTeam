class RenameSkillsUsersToSkillsEmployees < ActiveRecord::Migration
  def change
    rename_table :skills_users, :skills_employees
  end
end

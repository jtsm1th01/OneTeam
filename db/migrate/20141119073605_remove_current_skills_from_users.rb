class RemoveCurrentSkillsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :current_skills
  end
end

class AddCurrentSkillsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :CurrentSkills, :integer
  end
end

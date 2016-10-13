class AddSkillLevelToCurrentSkills < ActiveRecord::Migration
  def change
    add_column :current_skills, :skill_level, :integer
  end
end

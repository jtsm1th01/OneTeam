class DesiredSkillsFieldTypes < ActiveRecord::Migration
  def change
    change_column :desired_skills, :skill_id, :integer
    change_column :desired_skills, :employee_id, :integer
  end
end

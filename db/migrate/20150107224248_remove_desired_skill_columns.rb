class RemoveDesiredSkillColumns < ActiveRecord::Migration
  def change
    remove_column :desired_skills, :skill_id
    remove_column :desired_skills, :employee_id
  end
end

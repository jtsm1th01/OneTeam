class AddNewDesiredSkillColumns < ActiveRecord::Migration
  def change
    add_column :desired_skills, :skill_id, :integer
    add_column :desired_skills, :employee_id, :integer
  end
end

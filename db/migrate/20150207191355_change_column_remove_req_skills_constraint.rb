class ChangeColumnRemoveReqSkillsConstraint < ActiveRecord::Migration
  def change
    change_column :required_skills, :project_request_id, :integer, :null => true
    change_column :required_skills, :skill_id, :integer, :null => true
  end
end

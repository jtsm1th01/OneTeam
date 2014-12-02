class RemoveSkillIdFromProjReqTable < ActiveRecord::Migration
  def change
    remove_column :project_requests, :skill_id
  end
end

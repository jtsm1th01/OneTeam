class CreateProjreqSkillsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :project_requests, :skills
  end
end

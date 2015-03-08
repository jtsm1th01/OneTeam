class RenameProjectRequestsSkillsToRequiredSkills < ActiveRecord::Migration
  def change
    rename_table :project_requests_skills, :required_skills
  end
end

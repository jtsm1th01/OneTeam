class FixNames < ActiveRecord::Migration
  def change
    rename_column :departments, :DeptName, :department_name
    rename_column :locations, :LocName, :location_name
    rename_column :projects, :ProjName, :project_name
    rename_column :projects, :ProjStart, :project_start
    rename_column :projects, :ProjEnd, :project_end
    rename_column :projects, :Contact, :contact
    rename_column :titles, :Title, :title
    rename_column :skills, :SkillName, :skill_name
    rename_column :users, :UserName, :user_name
    rename_column :users, :UserEmail, :user_email
    rename_column :users, :CurrentSkills, :current_skills
  end
end

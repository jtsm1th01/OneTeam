class AddColumnToRequiredSkills < ActiveRecord::Migration
  def change
    add_column :required_skills, :id, :primary_key
  end
end

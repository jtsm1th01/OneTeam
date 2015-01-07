class CreateDesiredSkills < ActiveRecord::Migration
  def change
    create_table :desired_skills do |t|
      t.string :skill_id
      t.string :employee_id

      t.timestamps
    end
  end
end

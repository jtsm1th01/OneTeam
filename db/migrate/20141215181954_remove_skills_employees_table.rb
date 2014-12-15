class RemoveSkillsEmployeesTable < ActiveRecord::Migration
  def change
    drop_table :skills_employees
  end
end

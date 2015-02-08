class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :employee_id
      t.integer :project_request_id

      t.timestamps
    end
  end
end

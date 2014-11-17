class CreateProjectRequests < ActiveRecord::Migration
  def change
    create_table :project_requests do |t|
      t.integer :project_id
      t.integer :contact_id
      t.integer :department_id
      t.integer :location_id
      t.date :project_start
      t.date :project_end
      t.integer :skill_id

      t.timestamps
    end
  end
end

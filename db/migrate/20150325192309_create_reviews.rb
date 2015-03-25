class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :assignment_id
      t.integer :skill_id
      t.integer :experience
      t.integer :skill_level

      t.timestamps
    end
  end
end

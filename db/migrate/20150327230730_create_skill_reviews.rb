class CreateSkillReviews < ActiveRecord::Migration
  def change
    create_table :skill_reviews do |t|
      t.integer :review_id
      t.integer :skill_id
      t.integer :experience
      t.integer :skill_level

      t.timestamps
    end
  end
end

class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :assignment_id

      t.timestamps
    end
  end
end

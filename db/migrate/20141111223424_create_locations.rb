class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :LocName

      t.timestamps
    end
  end
end

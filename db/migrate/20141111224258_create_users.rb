class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :UserName
      t.string :UserEmail

      t.timestamps
    end
  end
end

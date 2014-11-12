class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :ProjName
      t.integer :Contact
      t.date :ProjStart
      t.date :ProjEnd

      t.timestamps
    end
  end
end

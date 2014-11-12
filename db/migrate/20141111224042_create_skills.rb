class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :SkillName

      t.timestamps
    end
  end
end

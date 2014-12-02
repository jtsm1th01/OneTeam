class CreateUserSkillJoinTable < ActiveRecord::Migration
  def change
    create_join_table :users, :skills
  end
end

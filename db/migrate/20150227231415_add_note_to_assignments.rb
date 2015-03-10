class AddNoteToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :note, :text
  end
end

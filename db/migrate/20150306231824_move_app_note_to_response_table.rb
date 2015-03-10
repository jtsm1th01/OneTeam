class MoveAppNoteToResponseTable < ActiveRecord::Migration
  def change
    remove_column :assignments, :note
    add_column :responses, :comment, :text
  end
end

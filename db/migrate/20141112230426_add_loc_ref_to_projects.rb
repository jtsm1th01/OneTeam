class AddLocRefToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :location, index: true
  end
end

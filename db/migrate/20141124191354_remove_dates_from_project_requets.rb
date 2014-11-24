class RemoveDatesFromProjectRequets < ActiveRecord::Migration
  def change
    remove_column :project_requests, :project_start, :project_end
  end
end

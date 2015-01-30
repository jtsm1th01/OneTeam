class AddEndDateToProjectRequests < ActiveRecord::Migration
  def change
    add_column :project_requests, :start_date, :date
    add_column :project_requests, :end_date, :date
  end
end

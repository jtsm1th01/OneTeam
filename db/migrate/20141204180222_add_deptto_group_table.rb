class AddDepttoGroupTable < ActiveRecord::Migration
  def change
    add_column :groups, :department_id
  end
end

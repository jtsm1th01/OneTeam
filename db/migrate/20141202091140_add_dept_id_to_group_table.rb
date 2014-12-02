class AddDeptIdToGroupTable < ActiveRecord::Migration
  def change
    add_column :groups, :department_id, :integer
  end
end

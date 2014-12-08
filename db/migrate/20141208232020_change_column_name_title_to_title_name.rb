class ChangeColumnNameTitleToTitleName < ActiveRecord::Migration
  def change
    rename_column :titles, :title, :title_name
  end
end

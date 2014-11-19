class NewUserProfileInfo < ActiveRecord::Migration
  def change
    add_column :users, :years_with_company, :integer
  end
end

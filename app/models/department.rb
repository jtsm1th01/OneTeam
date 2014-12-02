class Department < ActiveRecord::Base
  has_many :employees
  has_many :groups
end

class Group < ActiveRecord::Base
  has_many :employees
  belongs_to :department
end

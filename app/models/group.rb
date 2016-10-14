class Group < ActiveRecord::Base
  has_many :employees
  belongs_to :department
  has_many :project_requests #not needed (not used?)
  validates :group_name, presence: true, uniqueness: true
  validates :department, presence: true
end

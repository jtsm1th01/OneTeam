class Group < ActiveRecord::Base
  has_many :employees
  belongs_to :department
  has_many :project_requests #not needed (not used?)
  
  validates :department, presence: true
end

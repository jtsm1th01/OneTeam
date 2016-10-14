class Department < ActiveRecord::Base
  has_many :employees
  has_many :groups
  has_many :project_requests, through: :groups #needed (not used?)
  validates :department_name, presence: true, uniqueness: true
end

class Assignment < ActiveRecord::Base
  belongs_to :employee
  belongs_to :project_request
  
  validates :employee, uniqueness: true

end

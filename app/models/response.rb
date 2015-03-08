class Response < ActiveRecord::Base
  attr_accessor :employee_name
  validates :employee_id, uniqueness: { scope: :project_request_id }
  
  belongs_to :project_request
  belongs_to :employee
end

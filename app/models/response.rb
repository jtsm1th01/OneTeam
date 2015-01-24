class Response < ActiveRecord::Base
  attr_accessor :employee_name
  
  belongs_to :project_request
  belongs_to :employee
end

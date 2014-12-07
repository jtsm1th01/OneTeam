class Project < ActiveRecord::Base
  has_many :project_requests
  has_one :employee
end

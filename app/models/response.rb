class Response < ActiveRecord::Base
  belongs_to :project_request
  belongs_to :employee
end

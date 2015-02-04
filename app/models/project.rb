class Project < ActiveRecord::Base
  has_many :project_requests
  belongs_to :lead, :class_name => :Employee, :foreign_key => "employee_id"
end

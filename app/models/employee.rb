class Employee < ActiveRecord::Base
  has_and_belongs_to_many :skills
  belongs_to :location
  belongs_to :department
  belongs_to :title
  belongs_to :group
  has_many :project_requests
  has_many :projects
  has_many :subordinates, :class_name => "Employee",
    :foreign_key => "manager_id"
  belongs_to :manager, :class_name => "Employee",
    :foreign_key => "manager_id"
end

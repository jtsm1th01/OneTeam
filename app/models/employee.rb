class Employee < ActiveRecord::Base
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
  has_many :current_skills
  has_many :desired_skills
  has_many :skills, :through => :current_skills
  has_many :goals, :through => :desired_skills, source: :skills
end

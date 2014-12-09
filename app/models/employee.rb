class Employee < ActiveRecord::Base
  has_and_belongs_to_many :skills
  belongs_to :location
  belongs_to :department
  belongs_to :title
  belongs_to :group
  has_many :project_requests
  has_many :projects
end

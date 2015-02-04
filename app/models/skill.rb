class Skill < ActiveRecord::Base
  has_many :current_skills
  has_many :employees, through: :current_skills
  has_many :desired_skills
  has_many :employees, through: :desired_skills
  has_many :project_requests, through: :required_skills
  has_many :required_skills
end

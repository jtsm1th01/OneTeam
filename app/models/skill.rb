class Skill < ActiveRecord::Base
  has_many :current_skills
  has_many :employees, through: :current_skills
  has_many :desired_skills
  has_many :employees, through: :desired_skills
end

class ProjectRequest < ActiveRecord::Base
  has_one :department
  has_one :location
  has_many :skills
  belongs_to :project
  belongs_to :user
end
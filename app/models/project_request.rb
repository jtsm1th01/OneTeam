class ProjectRequest < ActiveRecord::Base
  has_one :department
  belongs_to :location
  belongs_to :group
  has_many :skills
  belongs_to :project
  belongs_to :user
end
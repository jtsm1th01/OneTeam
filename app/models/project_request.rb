class ProjectRequest < ActiveRecord::Base
  has_one :department, through: :project
  has_one :location, through: :project
  has_many :skills
  belongs_to :project
  belongs_to :user
end

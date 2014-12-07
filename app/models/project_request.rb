class ProjectRequest < ActiveRecord::Base
  has_and_belongs_to_many :skills
  belongs_to :project
  has_one :department, through: :group
end
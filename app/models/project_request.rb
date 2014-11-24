class ProjectRequest < ActiveRecord::Base
  belongs_to :department
  belongs_to :location
  belongs_to :group
  belongs_to :skill
  belongs_to :project
  belongs_to :user
end
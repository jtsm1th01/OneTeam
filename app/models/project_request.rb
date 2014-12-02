class ProjectRequest < ActiveRecord::Base
  belongs_to :department #test comment
  belongs_to :location
  belongs_to :group
  has_and_belongs_to_many :skills
  belongs_to :project
  belongs_to :user
end
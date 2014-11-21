class ProjectRequest < ActiveRecord::Base
  has_one :department
  belongs_to :location
  belongs_to :group
  has_many :skills
  has_and_belongs_to_many :projects
  belongs_to :user
end
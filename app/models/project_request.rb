class ProjectRequest < ActiveRecord::Base
  validates :description, presence: true
  has_and_belongs_to_many :skills
  belongs_to :project
  has_one :department, through: :group
  has_many :responses
end
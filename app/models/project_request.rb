class ProjectRequest < ActiveRecord::Base
  validates :description, presence: true
  has_and_belongs_to_many :skills
  belongs_to :project
  belongs_to :employee
  has_one :department, through: :group
  has_many :responses
  has_many :respondents, through: :responses, :source => :employee
  accepts_nested_attributes_for :responses
end
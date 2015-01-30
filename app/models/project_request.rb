class ProjectRequest < ActiveRecord::Base
  validates :description, presence: true
  has_and_belongs_to_many :skills
  belongs_to :project
  belongs_to :employee
  has_one :department, through: :group
  has_many :responses
  has_many :respondents, through: :responses, :source => :employee
  has_many :assignments 
  accepts_nested_attributes_for :responses
  
  scope :current, -> { where('end_date>?', Date.today-1) }
  scope :open, -> { where('filled=?', false) }
  scope :started, -> { where('start_date<?', Date.today+1) }
 
end
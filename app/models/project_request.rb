class ProjectRequest < ActiveRecord::Base
  validates :description, presence: true
  validates :project_id, presence: true
  
  has_many :skills, :through => :required_skills
  has_many :required_skills, :dependent => :destroy
  belongs_to :project
  belongs_to :employee
  has_many :responses
  has_many :respondents, through: :responses, :source => :employee
  has_many :assignments
  has_many :developers, through: :assignments, :source => :employee
  accepts_nested_attributes_for :responses
  
  scope :current, -> { where('end_date>?', Date.today-1) }
  scope :open, -> { where('filled=?', false) }
  scope :started, -> { where('start_date<?', Date.today+1) }
 
end
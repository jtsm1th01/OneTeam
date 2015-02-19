class ProjectRequest < ActiveRecord::Base
  validates :description, presence: true
  has_many :skills, :through => :required_skills
  has_many :required_skills, :dependent => :destroy
  belongs_to :project
  belongs_to :employee
  has_many :responses
  has_many :respondents, through: :responses, :source => :employee
  has_many :assignments
  accepts_nested_attributes_for :responses
  
  scope :current, -> { where('end_date>?', Date.today-1) }
  scope :open, -> { where('filled=?', false) }
  scope :started, -> { where('start_date<?', Date.today+1) }
  
  # takes a developer parameter and returns a count of how many skills the developer has that the request asks for
  def qualified_count(employee)
    ps=project_request.skills
    es=employee.skills
    q=ps&es
    return q.count
  end
  
  # takes a developer parameter and returns a count of how many skills the developer is interested in that the request asks for
  def interest_count
    i=current_user.goals&project_request.skills
    i.count
  end
 
end
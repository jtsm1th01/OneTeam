class ProjectRequest < ActiveRecord::Base
  validates :description, presence: true
  validates :project_id, presence: true
  validates_numericality_of :end_date, greater_than_or_equal_to: :start_date, message: "must be equal to or later than Start Date"
  
  has_many :skills, :through => :required_skills
  has_many :required_skills, :dependent => :destroy
  belongs_to :project
  belongs_to :employee
  has_many :responses
  has_many :respondents, through: :responses, :source => :employee
  has_many :assignments
  has_many :developers, through: :assignments, :source => :employee
  accepts_nested_attributes_for :responses
  accepts_nested_attributes_for :required_skills, :allow_destroy => true, reject_if: lambda {|attributes| attributes['skill_id'].blank?}
  
  scope :current, -> { where('end_date>?', Date.today-1) }
  scope :open, -> { where('filled=?', false) }
  scope :started, -> { where('start_date<?', Date.today+1) }
   
  # returns a count of how many skills the developer is interested in that the request asks for
  def interested_skill_percent_match(current_employee)
    match_count = (self.skills & current_employee.goals).count
    percentage_float = (match_count/(self.skills.count.nonzero? || 1).to_f) * 100
  end
  
  # returns relevance based on matched skill levels divided by best possible match
  def required_skill_relevance(current_employee)
    matched_skills = (self.skills & current_employee.skills)
    skill_levels = Array.new
    matched_skills.each do |matched_skill|
      current_employee.current_skills.each do |current_skill|
        if current_skill.skill == matched_skill
          skill_levels.push(current_skill.skill_level)
        end
      end
    end
    total_max_level_count = (self.skills.count)*4
    relevance_percentage = skill_levels.sum/((total_max_level_count.nonzero? || 1).to_f) * 100
  end
      
end
class CurrentSkill < ActiveRecord::Base
  belongs_to :employee
  belongs_to :skill
  
  validates :skill_level, presence: true
end

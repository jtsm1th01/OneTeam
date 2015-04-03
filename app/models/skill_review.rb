class SkillReview < ActiveRecord::Base
  belongs_to :review
  belongs_to :skill
  
  validates :experience, presence: true
end

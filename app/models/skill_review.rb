class SkillReview < ActiveRecord::Base
  belongs_to :review
  belongs_to :skill
  
end

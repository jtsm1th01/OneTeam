class SkillReview < ActiveRecord::Base
  belongs_to :review
  belongs_to :skill
  
  validates :experience, presence: true
  validate :exp_points_must_be_0_if_na_assessment
  
  def exp_points_must_be_0_if_na_assessment
    if skill_level == 0 && experience != 0
      errors.add(:skill_level, "cannot be N/A if experience is awarded.")
    end
  end
  
end

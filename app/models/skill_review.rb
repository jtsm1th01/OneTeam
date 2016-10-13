class SkillReview < ActiveRecord::Base
  belongs_to :review
  belongs_to :skill
  
  validates :experience, presence: true
  validate :exp_cant_be_0_if_skill_lvl_chosen
  validate :exp_points_must_be_0_if_na_assessment
  
  
  def exp_points_must_be_0_if_na_assessment
    if skill_level == 0 && experience != 0
      errors.add(:skill_level, "must be assessed if experience is awarded.")
    end
  end
  
  def exp_cant_be_0_if_skill_lvl_chosen
    if experience == 0 && skill_level != 0
      errors.add(:experience, "must be awarded if skill level is assessed.")
    end
  end
  
end

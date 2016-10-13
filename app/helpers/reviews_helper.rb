module ReviewsHelper
    
  def default_skill_value(employee, skill, button_value)
    if @review.skill_reviews.find_by(:skill => skill)
      skill_review_level = @review.skill_reviews.find_by(:skill => skill).skill_level 
      if skill_review_level == button_value
        return true
      else
        return false
      end
    else
      current_skill = CurrentSkill.find_by(:employee => employee, :skill => skill)
      if !current_skill.nil? && current_skill.skill_level == button_value
        return true
      elsif button_value == 0
        return true
      end
    end
  end
  
  def project_duration(project_request)
    (project_request.end_date - project_request.start_date).to_i + 1
  end
  
  def default_experience_value(project_request, skill)
    if @review.skill_reviews.find_by(:skill => skill)
      return @review.skill_reviews.find_by(:skill => skill).experience 
    else
      (project_request.end_date - project_request.start_date).to_i + 1
    end
  end
  
end

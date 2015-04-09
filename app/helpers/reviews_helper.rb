module ReviewsHelper
    
  def default_radio_value(employee, skill, button_value)
    current_skill = CurrentSkill.find_by(:employee => employee, :skill => skill)
    if !current_skill.nil? && current_skill.skill_level == button_value
      return true
    elsif button_value == 0
      return true
    end
  end
  
  def project_duration(project_request)
    (project_request.end_date - project_request.start_date).to_i + 1
  end
  
end

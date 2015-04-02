module ApplicationHelper
  
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "OneTeam"
    if page_title.empty?
      base_title
    else
      "#{base_title} - #{page_title}"
    end
  end
  
  def current_assignment(project_request, respondent)
    assignment=Assignment.find_by(:project_request => project_request, :employee => respondent)
  end
  
  def current_response(project_request, respondent)
    response=Response.find_by(:project_request => project_request, :employee => respondent)
  end
    
  def current_review(assignment)
    review=Review.find_by(:assignment => assignment)
  end
  
end

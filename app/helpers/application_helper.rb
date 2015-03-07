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
    assignment=Assignment.where(:project_request => project_request, :employee => respondent)
    current_assignment=assignment.first
  end
  
  def current_response(project_request, respondent)
    response=Response.where(:project_request => project_request, :employee => respondent)
    current_response=response.first
  end

end

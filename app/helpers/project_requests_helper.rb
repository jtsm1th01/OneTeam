module ProjectRequestsHelper
  
  def in_progress(project_request)
    if project_request.start_date<Date.today+1
      "(*** IN PROGRESS ***)"
    end
  end
  
  def assignment_note(project_request, respondent)
    assignment=Assignment.find_by(:project_request => project_request, :employee => respondent).note
  end
  
  def response_note(project_request, respondent)
    response_note=Response.find_by(:project_request => project_request, :employee => respondent).note
  end
  
end

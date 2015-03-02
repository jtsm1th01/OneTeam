module ProjectRequestsHelper
  
  def in_progress(project_request)
    if project_request.start_date<Date.today+1
      "(*** IN PROGRESS ***)"
    end
  end
  
  def assignment_note(project_request, respondent)
    assignment=Assignment.where(:project_request => project_request, :employee => respondent)
    assignment1=assignment.first
    assignment1.note
  end
  
  def response_note(project_request, respondent)
    response=Response.where(:project_request => project_request, :employee => respondent)
    response1=response.first
    response1.note
  end
  
end

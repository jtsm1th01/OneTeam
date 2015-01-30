module ProjectRequestsHelper
  
  def in_progress(project_request)
    if project_request.start_date<Date.today+1
      "(IN PROGRESS)"
    end
  end
    
end

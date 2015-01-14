module SessionsHelper
  # Logs in the given employee.
  def log_in(employee)
    session[:employee_id] = employee.id
  end
end

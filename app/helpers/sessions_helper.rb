module SessionsHelper
  # Logs in the given employee.
  def log_in(employee)
    session[:employee_id] = employee.id
  end
  
  # Returns the user corresponding to the remember token cookie.
  def current_employee
    if (employee_id = session[:employee_id])
      @current_employee ||= Employee.find_by(id: employee_id)
    elsif (employee_id = cookies.signed[:employee_id])
      employee = Employee.find_by(id: employee_id)
      if employee && employee.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
   end
  
  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_employee.nil?
  end
  
  # Remembers a user in a persistent session.
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
  
  # Logs out the current user.
  def log_out
    session.delete(:employee_id)
    @current_employee = nil
  end
  
end

module SessionsHelper
  # Logs in the given employee.
  def log_in(employee)
    session[:employee_id] = employee.id
  end
  
  # Returns the employee corresponding to the remember token cookie.
  def current_employee
    if (employee_id = session[:employee_id])
      @current_employee ||= Employee.find_by(id: employee_id)
    elsif (employee_id = cookies.signed[:employee_id])
      employee = Employee.find_by(id: employee_id)
      if employee && employee.authenticated?(cookies[:remember_token])
        log_in employee
        @current_employee = employee
      end
    end
   end
  
  # Returns true if the given employee is the current employee.
  def current_employee?(employee)
    employee == current_employee
  end
  
  # Returns true if the employee is logged in, false otherwise.
  def logged_in?
    !current_employee.nil?
  end
  
  # Logs out the current employee.
  def log_out
    forget(current_employee)
    session.delete(:employee_id)
    @current_employee = nil
  end
  
  # Remembers a employee in a persistent session.
  def remember(employee)
    employee.remember
    cookies.permanent.signed[:employee_id] = employee.id
    cookies.permanent[:remember_token] = employee.remember_token
  end
  
  # Forgets a persistent session.
  def forget(employee)
    employee.forget
    cookies.delete(:employee_id)
    cookies.delete(:remember_token)
  end
  
  # Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
  
end

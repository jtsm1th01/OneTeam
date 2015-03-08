class SessionsController < ApplicationController
  def new
    @employee = Employee.new
  end
  
  def create
    employee = Employee.find_by(employee_email: params[:session][:email].downcase)
    if employee && employee.authenticate(params[:session][:password])
      log_in employee
      params[:session][:remember_me] == '1' ? remember(employee) : forget(employee)
      redirect_back_or project_requests_path
    else
      redirect_to login_path, alert: "Invalid email/password combination."
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
  
end

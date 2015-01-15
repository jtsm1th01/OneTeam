class SessionsController < ApplicationController
  def new
  end
  
  def create
    employee = Employee.find_by(employee_email: params[:session][:email].downcase)
    if employee && employee.authenticate(params[:session][:password])
      log_in employee
      remember user
      redirect_to employee
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
  
end
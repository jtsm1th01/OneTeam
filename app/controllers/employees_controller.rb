class EmployeesController < ApplicationController
  before_action :logged_in_employee, only: [:index, :edit, :update]
  before_action :correct_employee,   only: [:edit, :update]
  before_action :admin_employee,     only: :destroy

  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
    @employees = Employee.all
    @titles = Title.all
    @groups = Group.all
    @locations = Location.all
    @skills = Skill.all
  end

  def edit
    @employee = Employee.find(params[:id])
    @employees = Employee.all
    @titles = Title.all
    @groups = Group.all
    @locations = Location.all
    @skills = Skill.all
    @employee.current_skills.build
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      log_in @employee
      redirect_to edit_employee_url(@employee), notice: 'Employee has been successfully created. Please complete your profile.'
    else
      render new_employee_path(@employee) 
    end
  end

  def update
    @employee = Employee.find(params[:id])
    params[:employee][:goal_ids] ||=[]
    raise exception
    if @employee.update_attributes(employee_params)
      redirect_to @employee, notice: 'Employee was successfully updated.' 
    else
      redirect_to edit_employee_url(@employee), notice: 'Please complete all fields.'
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_url, notice: 'Employee was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    # Before filters
  
    # Confirms a logged-in employee.
    def logged_in_employee
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
  
    # Confirms the correct employee.
    def correct_employee
      @employee = Employee.find(params[:id])
      redirect_to(root_url) unless current_employee?(@employee)
    end
  
    # Confirms an admin employee.
    def admin_employee
      redirect_to(root_url) unless current_employee.admin?
    end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:employee_name, :employee_email, :years_with_company, :location_id, :group_id, :title_id, :manager_id, :password, :password_confirmation, current_skills_attributes: [:id, :skill_id, :skill_level], :goal_ids => [])
    end
end

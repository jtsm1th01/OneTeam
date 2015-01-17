class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_employee, only: [:index, :edit, :update]
  before_action :correct_employee,   only: [:edit, :update]
  before_action :admin_employee,     only: :destroy

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
   
     
  end

  # GET /employees/new
  def new
    @employee = Employee.new
    @employees = Employee.all
    @titles = Title.all
    @groups = Group.all
    @locations = Location.all
    @skills = Skill.all
  end

  # GET /employees/1/edit
  def edit
    @employees = Employee.all
    @titles = Title.all
    @groups = Group.all
    @locations = Location.all
    @skills = Skill.all
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)
    respond_to do |format|
      if @employee.save
        log_in @employee
        format.html { redirect_to edit_employee_url(@employee), notice: 'Employee has been successfully created.' }
      else
        format.html { render new_employee_path(@employee) }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    params[:employee][:skill_ids] ||=[]
    respond_to do |format|
      if @employee.update_attributes(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
      else
        format.html { redirect_to edit_employee_url(@employee), notice: 'Please complete all fields.'}
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    # Before filters
  
    def set_employee
      @employee = Employee.find(params[:id])
    end

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
      params.require(:employee).permit(:employee_name, :employee_email, :years_with_company, :location_id, :group_id, :title_id, :manager_id, :password,             :password_confirmation, :skill_ids => [], :goal_ids => [])
    end
end

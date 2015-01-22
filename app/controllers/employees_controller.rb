class EmployeesController < ApplicationController

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
  end

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

  def update
    @employee = Employee.find(params[:id])
    params[:employee][:skill_ids] ||=[]
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
      else
        format.html { redirect_to edit_employee_path(@employee), notice: 'Please complete all fields.'}
      end
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:employee_name, :employee_email, :years_with_company, :location_id, :group_id, :title_id, :manager_id, :password, :password_confirmation, :skill_ids => [], :goal_ids => [])
    end
end

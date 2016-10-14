class EmployeesController < ApplicationController
  before_action :logged_in_employee, only: [:index, :edit, :update]
  before_action :correct_employee,   only: [:edit, :update]
  before_action :admin_employee,     only: :destroy

  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
    @experience_totals = experience_totals(@employee)
    @skill_level_averages = skill_level_averages(@employee)
  end

  def new
    @employee = Employee.new
    @employees = Employee.all
    @titles = Title.all
    @departments = Department.all
    @locations = Location.all
    @skills = Skill.all
  end

  def edit
    @employee = Employee.find(params[:id])
    @employees = Employee.all
    @titles = Title.all
    @departments = Department.all
    @locations = Location.all
    @skills = Skill.all
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
    @employees = Employee.all
    @titles = Title.all
    @departments = Department.all
    @locations = Location.all
    @skills = Skill.all
    
    if params[:add_current_skill]
      @employee.attributes = employee_params
      @employee.current_skills.build
      render 'edit'
    elsif params[:add_desired_skill]
      @employee.attributes = employee_params
      @employee.desired_skills.build
      render 'edit'
    else
      if @employee.update_attributes(employee_params)
        redirect_to @employee, notice: 'Employee was successfully updated.' 
      else
        @employee.current_skills.build
        @employee.desired_skills.build
        render :edit
      end
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
  
    def experience_totals(employee)
    experience_totals = Hash.new(0)
      employee.assignments.each do |assignment|
        assignment.review.try(:skill_reviews).try(:each) do |skill_review|
          experience_totals[skill_review.skill.skill_name] += skill_review.experience
        end
      end
      return experience_totals
    end
  
    def skill_level_averages(employee)
      skill_reviews = Hash.new(0)
      employee.skill_reviews.each do |skill_review|
        if skill_reviews.has_key?(skill_review.skill.skill_name)
          skill_reviews[skill_review.skill.skill_name] << skill_review.skill_level
        else
          skill_reviews[skill_review.skill.skill_name] = [skill_review.skill_level]
        end
      end
      skill_level_averages = skill_reviews.map { |skill,skill_level| [skill, (skill_level.sum.to_f / skill_level.count).round] }
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
      params.require(:employee).permit(:employee_name, :employee_email, :years_with_company, :location_id, :department_id, :title_id, :manager_id, :password, :password_confirmation, current_skills_attributes: [:id, :skill_id, :skill_level, :_destroy], desired_skills_attributes: [:id, :skill_id, :_destroy])
    end
end

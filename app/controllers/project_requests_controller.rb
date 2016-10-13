class ProjectRequestsController < ApplicationController
  before_action :logged_in_employee, only: [:new, :edit]
  
  def index
    if params.include?(:employee_id)
      @project_requests = ProjectRequest.where(employee_id: params[:employee_id])
    else
      @project_requests = ProjectRequest.current.open
    end
  end

  def new
    @project_request = ProjectRequest.new
    @projects = Project.all
    @skills = Skill.all
    @project_request.required_skills.build
  end

  def edit
   @project_request = ProjectRequest.find(params[:id])
   @employees = Employee.all
   @groups = Group.all
   @projects = Project.all
   @skills = Skill.all
  end

  def create
    @project_request = current_employee.project_requests.new(project_request_params)
    @projects = Project.all
    @skills = Skill.all
    
    if params[:add_skill]
      @project_request.required_skills.build
      render 'new'
    else
      if @project_request.save(project_request_params)
        flash.now[:success] = 'Project request created.'
        redirect_to my_project_requests_url(current_employee) 
      else
        @project_request.required_skills.build
        render 'new'
      end
    end
  end

  def update
    @project_request = ProjectRequest.find(params[:id])
    @employees = Employee.all
    @groups = Group.all
    @projects = Project.all
    @skills = Skill.all
    
    if params[:add_skill]
      @project_request.attributes = project_request_params
      @project_request.required_skills.build
      render 'edit'
    else
      if @project_request.update_attributes(project_request_params)
        redirect_to my_project_requests_url(current_employee), notice: 'Project request was successfully updated.'
      else
        @project_request.required_skills.build
        render :edit
      end
    end
  end

  def destroy
    @project_request = ProjectRequest.find(params[:id])
    @project_request.destroy
    redirect_to my_project_requests_url(current_employee), notice: 'Project request was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  
    # Confirms a logged-in employee.
    def logged_in_employee
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_request_params
      params.require(:project_request).permit(:project_id, :description, :employee_id, :start_date, :end_date, :filled, required_skills_attributes: [:id, :skill_id, :_destroy])
    end
end

class ProjectRequestsController < ApplicationController
  before_action :set_project_request, only: [:edit, :update, :destroy]
  before_action :logged_in_employee, only: [:new, :edit]
  
  def index
    if params.include?(:employee_id)
      @project_requests = ProjectRequest.where(employee_id: params[:employee_id])
    else
      @project_requests = ProjectRequest.current.open
    end
  end

  def new
    @projects = Project.all
    @project_request = ProjectRequest.new(employee_id: session[:employee_id])
  end

  def edit
   @employees = Employee.all
   @groups = Group.all
   @projects = Project.all
  end

  def create
    @project_request = ProjectRequest.new(project_request_params)

    respond_to do |format|
      if @project_request.save
        format.html { redirect_to project_requests_path, notice: 'Project request was successfully created.' }
      else
        format.html { redirect_to new_project_request_path(@project_request), notice: 'Please fill out entire form.' }
      end
    end
  end

  def update
    respond_to do |format|
      if @project_request.update(project_request_params)
        format.html { redirect_to project_requests_path, notice: 'Project request was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @project_request.destroy
    respond_to do |format|
      format.html { redirect_to project_requests_url, notice: 'Project request was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_request
      @project_request = ProjectRequest.find(params[:id])
    end
  
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
      params.require(:project_request).permit(:project_id, :description, :employee_id, :start_date, :end_date, :filled)
    end
end

class ProjectRequestsController < ApplicationController
  before_action :set_project_request, only: [:show, :edit, :update, :destroy]
  

  # GET /project_requests
  # GET /project_requests.json
  def index
    @project_requests = ProjectRequest.all
  end

  # GET /project_requests/1
  # GET /project_requests/1.json
  def show
  end

  # GET /project_requests/new
  def new
    @projects = Project.all
    @project_request = ProjectRequest.new(employee_id: session[:employee_id])
  end

  # GET /project_requests/1/edit
  def edit
   @employees = Employee.all
   @groups = Group.all
   @projects = Project.all
  end

  # POST /project_requests
  # POST /project_requests.json
  def create
    @project_request = ProjectRequest.new(project_request_params)

    respond_to do |format|
      if @project_request.save
        format.html { redirect_to @project_request, notice: 'Project request was successfully created.' }
      else
        format.html { redirect_to new_project_request_path(@project_request), notice: 'Please fill out entire form.' }
      end
    end
  end

  # PATCH/PUT /project_requests/1
  # PATCH/PUT /project_requests/1.json
  def update
    respond_to do |format|
      if @project_request.update(project_request_params)
        format.html { redirect_to @project_request, notice: 'Project request was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /project_requests/1
  # DELETE /project_requests/1.json
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_request_params
      params.require(:project_request).permit(:project_id, :description, :employee_id)
    end
end

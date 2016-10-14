class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    @employees = Employee.all
  end

  def new
    @project = Project.new
    @employees = Employee.all
  end

  def edit
    @project = Project.find(params[:id])
    @employees = Employee.all
  end

  def create
    @project = Project.new(project_params)
    @employees = Employee.all
    if @project.save
      redirect_to projects_url, notice: 'Project was successfully created.'
    else
      render 'new'
    end
  end

  def update
    @project = Project.find(params[:id])
      if @project.update(project_params)
        redirect_to projects_url, notice: 'Project was successfully updated.' 
      else
        redirect_to projects_url, alert: 'Project could not be updated.'
      end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:project_name, :project_start, :project_end, :employee_id)
    end
end

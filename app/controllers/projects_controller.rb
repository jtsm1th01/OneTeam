class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    @employees = Employee.all
  end

  def show
    @project = Project.find(params[:id])
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

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @project = Project.find(params[:id])
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:project_name, :project_start, :project_end, :employee_id)
    end
end

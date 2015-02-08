class DepartmentsController < ApplicationController
  before_action :admin_employee

  def index
    @departments = Department.all
  end

  def show
    @department = Department.find(params[:id])
  end

  def new
    @department = Department.new
  end

  def edit
    @department = Department.find(params[:id])
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to @department, notice: 'Department was successfully created.' 
    else
      render :new 
    end
  end

  def update
    @department = Department.find(params[:id])
      if @department.update(department_params)
        redirect_to @department, notice: 'Department was successfully updated.' 
      else
        render :edit
      end
  end

  def destroy
    @department = Department.find(params[:id])
    @department.destroy
    redirect_to departments_url, notice: 'Department was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def department_params
      params.require(:department).permit(:department_name)
    end
end

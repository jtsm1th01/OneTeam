class AssignmentsController < ApplicationController

  def new
    @assignment = Assignment.new(employee_id: params[:respondent_id], project_request_id: params[:project_request_id])
  end

  def edit
  end

  def create
    @assignment = Assignment.new(assignment_params)

    if @assignment.save
      redirect_to my_project_requests_path, notice: 'Assignment was successfully created.'
    else
      redirect_to my_project_requests_path, notice: 'There was a problem with the assignment.'
    end
  end

  def update
    if @assignment.update(assignment_params)
      redirect_to @assignment, notice: 'Assignment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @assignment.destroy
    redirect_to assignments_url, notice: 'Assignment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_params
      params.require(:assignment).permit(:employee_id, :project_request_id)
    end
end

class AssignmentsController < ApplicationController

  def create
    @assignment=Assignment.new(employee_id: params[:respondent_id], project_request_id: params[:project_request_id])
    if @assignment.save
      redirect_to my_project_requests_path, notice: 'Employee has been assigned.'
    else
      redirect_to my_project_requests_path, alert: 'There was a problem with the assignment.'
    end
  end

  def update
    @assignment = Assignment.find(params[:assignment_id])
    if @assignment.update(assignment_params)
      redirect_to my_project_requests_url(current_employee), notice: 'Assignment note updated.'
    else
      render :edit
    end
  end

  def destroy
    Assignment.destroy(params[:assignment_id])
    redirect_to :back, notice: 'Employee has been unassigned.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_params
      params.require(:assignment).permit(:employee_id, :project_request_id)
    end
end

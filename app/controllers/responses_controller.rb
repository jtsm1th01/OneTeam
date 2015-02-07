class ResponsesController < ApplicationController
  
  def new
    @project_request = ProjectRequest.find_by_id(params[:project_request_id])
    @response = @project_request.responses.new(employee_id: session[:employee_id])
  end
    
  def show
  end
  
  def create
    @response = current_employee.responses.build(response_params)
    respond_to do |format|
      if @response.save
        format.html { redirect_to project_requests_path, notice: 'Response was sent. Thank you for your interest.' }
      else
        format.html { render :new }
      end
    end
  end

  def response_params
    params.require(:response).permit(:project_request_id,:employee_id)
  end
  
end
  
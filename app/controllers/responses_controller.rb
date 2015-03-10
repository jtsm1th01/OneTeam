class ResponsesController < ApplicationController
  
  def new
    @project_request = ProjectRequest.find_by_id(params[:project_request_id])
    @response = @project_request.responses.new(employee_id: session[:employee_id])
  end
  
  def new_comment
    @response = Response.find(params[:response_id])
  end
  
  def edit
    @response = Response.find(params[:response_id])
  end
  
  def edit_comment
    @response = Response.find(params[:response_id])
  end

  def create
    @response = current_employee.responses.build(response_params)
      if @response.save
        redirect_to project_requests_path, notice: 'Response was sent. Thank you for your interest.'
      else
        redirect_to project_requests_path, alert: 'You have already applied.'
      end
  end
  
  def create_comment
    @response = Response.find(params[:response_id])
    if @response.update(response_params)
      redirect_to my_project_requests_path(current_employee), notice: 'Comment was added.'
    else
      redirect_to my_project_requests_path(current_employee), alert: 'Comment could not be added.'
    end
  end
  
  def update
    @response = Response.find(params[:response_id])
    if @response.update(response_params)
      redirect_to project_requests_path, notice: 'Application note updated.'
    else
      redirect_to project_requests_path, alert: 'Application note could not be updated.'
    end
  end
  
  def update_comment
    @response = Response.find(params[:response_id])
    if @response.update(response_params)
      redirect_to my_project_requests_path(current_employee), notice: 'Comment was updated.'
    else
      redirect_to my_project_requests_path(current_employee), alert: 'Comment could not be updated.'
    end
  end

  def response_params
    params.require(:response).permit(:project_request_id, :employee_id, :note, :comment)
  end
  
end
  
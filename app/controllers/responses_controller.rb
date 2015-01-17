class ResponsesController < ApplicationController
 
  def new
   @response = Response.new
  end
    
  def show
  end
  
  def create
    @response = Response.new(response_params)

    respond_to do |format|
      if @response.save
        format.html { redirect_to response_url(@response), notice: 'Response was sent.' }
      else
        format.html { render :new }
      end
    end
  end

  def response_params
    params.require(:response).permit(:employee_id, :project_request_id)
  end
  
end
  
class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @assignment = Assignment.find(params[:assignment_id])
    @employee = Employee.find(@assignment.employee_id)
    @assignment.project_request.required_skills.each do |required_skill|
      @review.skill_reviews.build(skill_id: required_skill.skill_id)
    end
  end
  
  def edit
    @review = Review.find(params[:review_id])
    @assignment = Assignment.find(params[:assignment_id])
    @employee = Employee.find(@assignment.employee_id)
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to my_project_requests_path(current_employee), notice: 'Review was successfully created.'
    else
      render :new
    end
  end
  
  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(review_params)
      redirect_to my_project_requests_path(current_employee), notice: 'Review was successfully updated.'
    else
      @assignment = Assignment.find(params[:review][:assignment_id])
      @employee = Employee.find(@assignment.employee_id)
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:assignment_id, skill_reviews_attributes: [:id, :skill_id, :experience, :skill_level])
    end
end

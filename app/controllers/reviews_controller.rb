class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
    @assignment = Assignment.find(params[:assignment_id])
    @review.skill_reviews.build
    @employee = Employee.find(@assignment.employee_id)
  end

  def edit
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
    if @review.update(review_params)
      redirect_to @review, notice: 'Review was successfully updated.' 
    else
      render :edit 
    end
  end

  def destroy
    @review.destroy
    redirect_to reviews_url, notice: 'Review was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:assignment_id, skill_reviews_attributes: [:id, :skill_id, :experience, :skill_level])
    end
end

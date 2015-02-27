class SkillsController < ApplicationController

  def index
    @skills = Skill.all
  end

  def new
    @skill = Skill.new
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def create
    @skill = Skill.new(skill_params)
      if @skill.save
        redirect_to skills_url, notice: 'Skill was successfully created.'
      else
        render :new
      end
  end

  def update
    @skill = Skill.find(params[:id])
      if @skill.update(skill_params)
        redirect_to skills_url, notice: 'Skill was successfully updated.' 
      else
        render :edit 
      end
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    redirect_to skills_url, notice: 'Skill was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def skill_params
      params.require(:skill).permit(:skill_name)
    end
end

class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
    @departments = Department.all
  end

  def edit
    @group = Group.find(params[:id])
    @departments = Department.all
  end

  def create
    @group = Group.new(group_params)
    @departments = Department.all
    if @group.save
      redirect_to groups_url, notice: 'Group was successfully created.' 
    else
      flash[:alert]= 'Please complete form.'
      render :new
    end
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to @group, notice: 'Group was successfully updated.' 
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_url, notice: 'Group was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:group_name, :department_id) 
    end
end

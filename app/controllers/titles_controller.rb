class TitlesController < ApplicationController

  def index
    @titles = Title.all
  end

  def show
    @title = Title.find(params[:id])
  end

  def new
    @title = Title.new
  end

  def edit
    @title = Title.find(params[:id])
  end

  def create
    @title = Title.new(title_params)

    respond_to do |format|
      if @title.save
        format.html { redirect_to @title, notice: 'Title was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @title = Title.find(params[:id])
    respond_to do |format|
      if @title.update(title_params)
        format.html { redirect_to @title, notice: 'Title was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @title = Title.find(params[:id])
    @title.destroy
    respond_to do |format|
      format.html { redirect_to titles_url, notice: 'Title was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def title_params
      params.require(:title).permit(:title_name)
    end
end

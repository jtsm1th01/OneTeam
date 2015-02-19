class StaticPagesController < ApplicationController
  def home
    if logged_in?
      redirect_to project_requests_path
    end
  end
end

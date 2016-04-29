class ProjectsController < ApplicationController

  def index
  end

  def show
    @project = Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'Project cannot be found'
    redirect_to root_path
  end

end

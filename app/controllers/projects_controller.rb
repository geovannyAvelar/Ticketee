class ProjectsController < ApplicationController

  before_action :set_project, only: [:edit, :update, :show, :destroy]

  def index

  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: 'Project has been created'
    else
      flash[:alert] = 'Project has not been created'
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project has been updated'
    else
      flash[:alert] = 'Project has not been updated'
      render :edit
    end
  end

  def show
  end

  def destroy
    @project.destroy
    redirect_to root_path, notice: 'Project has been deleted'
  end

  private

    def set_project
      @project = Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = 'Project cannot be found'
      redirect_to root_path
    end

    def project_params
      params.require(:project).permit(:name, :description)
    end

end

class TicketsController < ApplicationController

  before_action :set_ticket, only: [:edit, :update, :show, :destroy]
  before_action :set_project

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = @project.tickets.build(ticket_params)

    if @ticket.save
      redirect_to [@project, @ticket], notice: 'Ticket has been created'
    else
      flash[:alert] = 'Ticket has not been created'
      render :new
    end
  end

  def edit

  end

  def update
    if @ticket.update(ticket_params)
      redirect_to [@project, @ticket], notice: 'Ticket has been updated'
    else
      flash[:alert] = 'Ticket has not been updated'
      render :edit
    end
  end

  def show

  end

  private

    def set_ticket
      @ticket = Ticket.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = 'Ticket cannot be found'
      redirect_to root_path
    end

    def set_project
      @project = Project.find(params[:project_id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = 'Project cannot be found'
      redirect_to root_path
    end

    def ticket_params
      params.require(:ticket).permit(:title, :description)
    end

end

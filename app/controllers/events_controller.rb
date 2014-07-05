class EventsController < ApplicationController

  def index
    @events = Event.all.order(:date_time)
  end

  def new
  end

  def create
    @event = Event.new(event_params)
    @event.save
    redirect_to '/'
  end

  def edit
    @event = Event.find(params[:id])
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to '/'
  end

  private

    def event_params
      params.require(:event).permit(:game_title, :session_title, :event_image, :date_time, :address, :instructions, :description)
    end

end
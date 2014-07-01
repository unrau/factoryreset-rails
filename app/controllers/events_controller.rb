class EventsController < ApplicationController

  def index
  end

  def new
  end

  def create
    @event = Event.new(event_params)

    @event.save
    redirect_to @event
    # replace with redirect to home directory: redirect_to '/'
  end

  def show
    @event = Event.find(params[:id])
  end

  private
    def event_params
      params.require(:event).permit(:game_title, :session_title, :date_time, :address, :instructions, :description)
    end

end
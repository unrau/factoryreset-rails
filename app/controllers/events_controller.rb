class EventsController < ApplicationController

  def index
    @events = Event.upcoming
  end

  def old
    @events = Event.past
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.host = current_user
    if @event.save
      @event.rsvps.create(user: current_user)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to root_path, notice: 'event updated' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end

  private

    def event_params
      params.require(:event).permit(:game_title, :session_title, :event_image, :date_time, :address_title, :address, :instructions, :description)
    end

end
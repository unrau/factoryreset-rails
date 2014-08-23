class EventsController < ApplicationController

  def index
    @events = Event.upcoming
    @users = User.all_by_name
    @chats = Chat.newest
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
    @users = User.all

    if @event.save
      @event.rsvps.create(user: current_user)

      # Tell all members about the new event
      @users.each do |user|
        UserMailer.event_invite(user, @event).deliver
      end

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

        # Tell all members about the changes to the event
        #@event.rsvps.each do |rsvp|
        #  UserMailer.event_update(rsvp.user, @event).deliver
        #end

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

    # Tell all members about the cancellation
    @event.rsvps.each do |rsvp|
      UserMailer.event_cancel(rsvp.user, @event).deliver
    end

    @event.destroy
    redirect_to root_path

  end

  private

    def event_params
      params.require(:event).permit(:game_title, :session_title, :event_image, :date_time, :address_title, :address, :instructions, :description)
    end

end

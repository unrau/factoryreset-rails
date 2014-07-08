class RsvpsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @rsvp = @event.rsvps.new
    @rsvp.user = current_user
    @rsvp.save
    redirect_to root_path
  end

  def destroy
    @event = Event.find(params[:event_id])
    @rsvp = @event.rsvps.find(params[:id])
    @rsvp.destroy
    redirect_to root_path
  end

end

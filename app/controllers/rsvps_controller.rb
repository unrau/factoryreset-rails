class RsvpsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @rsvp = @event.rsvps.new
    @rsvp.user = current_user
    @url = 'http://www.factory-reset.net'
    if @rsvp.save
      UserMailer.rsvp_confirm(@rsvp.user, @event).deliver
      redirect_to root_path
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @rsvp = @event.rsvps.find(params[:id])
    @url = 'http://www.factory-reset.net'
    if @rsvp.destroy
      UserMailer.rsvp_remove(@rsvp.user, @event).deliver
      redirect_to root_path
    end
  end

end

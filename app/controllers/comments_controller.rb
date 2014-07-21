class CommentsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.new(comment_params)

    @comment.user = current_user

    if @comment.save
      @event.rsvps.each do |rsvp|
        # Only send a comment notification to RSVPd users who did not create the comment
        UserMailer.comment_notif(rsvp.user, @comment).deliver if rsvp.user != @comment.user
      end
    end

    redirect_to root_path
  end

  def destroy
    @event = Event.find(params[:event_id])
    @comment = @event.comments.find(params[:id])
    @comment.destroy
    redirect_to root_path
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end

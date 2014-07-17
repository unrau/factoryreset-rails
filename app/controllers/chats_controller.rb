class ChatsController < ApplicationController

  def index
    @chats = Chat.all
    redirect_to root_path
  end

  def show
    @chats = Chat.all
    redirect_to root_path
  end

  def create
    @chat = Chat.new(chat_params)
    @chat.user = current_user

    @users = User.all

    if @chat.save
      @users.each do |user|
        # Only send a comment notification to RSVPd users who did not create the comment
        UserMailer.chat_notif(user, @chat).deliver if user != current_user
      end
    end

    redirect_to root_path
  end

  def destroy
    @chat = Chat.find(params[:id])
    @chat.destroy
    redirect_to root_path
  end

  private

  def chat_params
    params.require(:chat).permit(:body)
  end
end

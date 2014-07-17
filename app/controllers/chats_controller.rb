class ChatsController < ApplicationController

  def index
    @chats = Chat.all
  end

  def show
    @chats = Chat.all
  end

  def create
    @chat = Chat.new(chat_params)
    @chat.user = current_user

    @users = User.all

    if @chat.save
      #@users.each do |user|
        # Send a General Chat notification
      #end
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

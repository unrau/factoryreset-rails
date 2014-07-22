class SessionsController < ApplicationController
  skip_before_filter :require_login

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to root_path
    else
      flash.now[:error] = 'request_denied(invalid)'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end

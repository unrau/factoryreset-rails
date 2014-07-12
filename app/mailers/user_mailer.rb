class UserMailer < ActionMailer::Base
  default from: 'pupugi@factory-reset.net'

  def welcome_email(user)
    @user = user
    @url  = 'http://www.factory-reset.net'
    mail(to: @user.email, subject: 'Welcome to Factory Reset')
  end

  def comment_notif(user, comment)
    @user = user
    @comment = comment
    @commenter = comment.user
    @event = comment.event
    @url = 'http://www.factory-reset.net'
    mail(to: @user.email, subject: "#{@commenter.username} has commented on #{@event.session_title}")
  end
end

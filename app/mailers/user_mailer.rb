class UserMailer < ActionMailer::Base
  default from: 'pupugi@factory-reset.net'

  def welcome_email(user)
    @user = user
    @url  = 'http://www.factory-reset.net'
    mail(to: @user.email, subject: 'Welcome to Factory Reset')
  end
end

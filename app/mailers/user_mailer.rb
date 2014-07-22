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

  def chat_notif(user, comment)
    @user = user
    @comment = comment
    @commenter = comment.user
    @url = 'http://www.factory-reset.net'
    mail(to: @user.email, subject: "#{@commenter.username} has commented in General Chat")
  end

  def event_invite(user, event)
    @user = user
    @event = event
    @url = 'http://www.factory-reset.net'
    if @user.email != @event.host.email
      mail(to: @user.email, subject: "#{@event.host.username} has created an event for #{Time.zone.parse(@event.date_time.to_s).strftime('%l:%M %p')}")
    else
      mail(to: @user.email, subject: "You are hosting a new event for #{Time.zone.parse(@event.date_time.to_s).strftime('%l:%M %p')}")
    end
  end

  def event_update(user, event)
    @user = user
    @event = event
    @url = 'http://www.factory-reset.net'
    if @user.email != @event.host.email
      mail(to: @user.email, subject: "#{@event.host.username} has updated #{@event.session_title}")
    else
      mail(to: @user.email, subject: "Your event has been updated: #{@event.session_title}")
    end
  end

  def event_cancel(user, event)
    @user = user
    @event = event
    if @user.email != @event.host.email
      mail(to: @user.email, subject: "#{@event.host.username} has cancelled #{@event.session_title}")
    else
      mail(to: @user.email, subject: "Your event has been cancelled: #{@event.session_title}")
    end
  end

  def rsvp_confirm(user, event)
    @user = user
    @event = event
    @url = 'http://www.factory-reset.net'
    mail(to: @user.email, subject: "You have RSVPd to #{@event.session_title}")
  end

  def rsvp_confirm_host(user, event)
    @user = user
    @event = event
    @url = 'http://www.factory-reset.net'
    mail(to: @event.host.email, subject: "#{@user.username} has RSVPd to your event #{@event.session_title}")
  end

  def rsvp_remove(user, event)
    @user = user
    @event = event
    @url = 'http://www.factory-reset.net'
    mail(to: @user.email, subject: "You have un-RSVPd from #{@event.session_title}")
  end

  def rsvp_remove_host(user, event)
    @user = user
    @event = event
    @url = 'http://www.factory-reset.net'
    mail(to: @event.host.email, subject: "#{@user.username} has un-RSVPd from your event #{@event.session_title}")
  end

  def event_reminder(user, event)
    @event = event
    @user = user
    @url = 'http://www.factory-reset.net'
    mail(to: @user.email, subject: "Event Reminder: #{@event.game_title} is in on #{Time.zone.parse(@event.date_time.to_s).strftime('%A')}")
  end

end

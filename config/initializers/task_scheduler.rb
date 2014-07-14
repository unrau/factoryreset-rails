require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

# Send the digest every day at noon
scheduler.cron('0 10 * * *') do
  @events = Event.upcoming
  @events.each do |event|
    if Date.today.beginning_of_day + 2.days == event.date_time.beginning_of_day
      event.rsvps.each do |rsvp|
        UserMailer.event_reminder(rsvp.user, event).deliver
      end
    end
  end
end
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

# Prevent Heroku from idling the app by running a process every 59 minutes
# Prevent Heroku from reporting downtime by running a process every 59 seconds
scheduler.every('59m') do
  puts "carry on my wayward son #{Random.rand(9999).to_s}"
end
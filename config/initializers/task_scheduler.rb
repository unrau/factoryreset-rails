require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

# Send the digest every day 3:00am GMT
scheduler.cron('0 3 * * *') do
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
scheduler.every('59s') do
  puts "carry on my wayward #{Random.rand(9999).to_s}"
end
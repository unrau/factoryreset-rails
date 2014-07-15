require 'rufus-scheduler'
require 'rest_client'

# Initialise Rufus Scheduler
scheduler = Rufus::Scheduler.new

# Initialize the Blower.io SMS API
blowerio = RestClient::Resource.new(ENV['BLOWERIO_URL'])

# Send reminder emails every day at 3:00am GMT (10:00 am PST)
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

# Send reminder SMS messages every day at 5:00am GMT (12:00 noon PST)
scheduler.cron('0 5 * * *') do
  @events = Event.upcoming
  @events.each do |event|
    if Date.today.beginning_of_day == event.date_time.beginning_of_day
      event.rsvps.each do |rsvp|
        blowerio['/messages'].post :to => "+1#{rsvp.user.telephone.gsub!('.','')}", :message => "See you at #{event.address_title} for #{event.game_title} at #{event.date_time.strftime('%l:%M %p')}! :3"
      end
    end
  end
end

# Prevent Heroku from idling the app by running a process every 59 minutes
# Prevent Heroku from reporting downtime by running a process every 59 seconds
scheduler.every('59s') do
  puts "carry on my wayward #{Random.rand(9999).to_s}"
end
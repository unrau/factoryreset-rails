require 'rufus-scheduler'
require 'rest_client'

# Initialise Rufus Scheduler
scheduler = Rufus::Scheduler.new

# Initialize the Blower.io SMS API
blowerio = RestClient::Resource.new(ENV['BLOWERIO_URL'])

# Send reminder emails every day at 9:00 am PST
scheduler.cron '0 9 * * * America/Vancouver' do
  @events = Event.upcoming
  @events.each do |event|
    if Date.today.beginning_of_day + 2.days == event.date_time.beginning_of_day
      event.rsvps.each do |rsvp|
        UserMailer.event_reminder(rsvp.user, event).deliver
      end
    end
  end
end

# Send reminder SMS messages 4 hours before an event
scheduler.every ('1m') do
  @events = Event.upcoming
  @events.each do |event|
    if Date.today.beginning_of_day == event.date_time.beginning_of_day
      event_time = event.date_time
      in_four_hours = DateTime.now + 4.hours
      if event_time.hour == in_four_hours.hour && event_time.min == in_four_hours.min
        event.rsvps.each do |rsvp|
          blowerio['/messages'].post :to => "+1#{rsvp.user.telephone.gsub!('.','')}", :message => "See you at #{event.address_title} for #{event.game_title} at #{event.date_time.strftime('%l:%M %p')}! :3"
        end
      end
    end
  end
end
require 'rufus-scheduler'
require 'rest_client'

# Initialise Rufus Scheduler
scheduler = Rufus::Scheduler.new

# Initialize the Blower.io SMS API
blowerio = RestClient::Resource.new(ENV['BLOWERIO_URL'])

# Send reminder emails every day at 9:00 am PST
scheduler.cron '00 9 * * * America/Vancouver' do
  @events = Event.upcoming
  @events.each do |event|
    if Date.today.beginning_of_day + 2.days == event.date_time.beginning_of_day
      event.rsvps.each do |rsvp|
        UserMailer.event_reminder(rsvp.user, event).deliver
      end
    end
  end
end

# Send reminder SMS messages every day at 12:00 noon PST
# TODO: Send this SMS 4 hours before the event, instead of at a set time.
scheduler.cron '0 12 * * * America/Vancouver' do
  @events = Event.upcoming
  @events.each do |event|
    if Date.today.beginning_of_day == event.date_time.beginning_of_day
      event.rsvps.each do |rsvp|
        blowerio['/messages'].post :to => "+1#{rsvp.user.telephone.gsub!('.','')}", :message => "See you at #{event.address_title} for #{event.game_title} at #{event.date_time.strftime('%l:%M %p')}! :3"
      end
    end
  end
end
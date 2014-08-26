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

    # Convert the event DateTime to the local timezone
    event_time = Time.zone.parse(event.date_time.to_s)

    # Emails should go out 2 days before the day of the event
    in_two_days = Time.zone.now + 2.days

    if in_two_days.beginning_of_day == event_time.beginning_of_day
      event.rsvps.each do |rsvp|
        UserMailer.event_reminder(rsvp.user, event).deliver
      end
    end
  end
end

# Send reminder SMS messages 4 hours before an event
scheduler.every '1m' do
  @events = Event.upcoming
  @events.each do |event|

    # Convert the event DateTime to the local timezone
    event_time = Time.zone.parse(event.date_time.to_s)

    # SMS Messages should go out 4 hours before the event starts
    in_four_hours = Time.zone.now + 4.hours

    if in_four_hours.beginning_of_day == event_time.beginning_of_day
      if in_four_hours.hour == event_time.hour && in_four_hours.min == event_time.min
        event.rsvps.each do |rsvp|
          blowerio['/messages'].post :to => "+1#{rsvp.user.telephone.gsub!('.','')}", :message => "See you at #{event.address_title} for #{event.game_title} at#{event.date_time.strftime('%l:%M %p')}! :3"
        end
      end
    end
  end
end
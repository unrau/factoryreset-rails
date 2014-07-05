class Event < ActiveRecord::Base

  # Order upcoming events by ascending
  scope :upcoming, ->{ all.where('date_time > ?', Date.today).order(:date_time) }

  # Order past events by descending
  scope :past, -> { all.where('date_time <= ?', Date.today).order('date_time DESC') }

end
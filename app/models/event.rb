class Event < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  validates :game_title, presence: true
  validates :session_title, presence: true

  # Order upcoming events by ascending
  scope :upcoming, ->{ all.where('date_time > ?', Date.today).order(:date_time) }

  # Order past events by descending
  scope :past, -> { all.where('date_time <= ?', Date.today).order('date_time DESC') }

end
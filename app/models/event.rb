class Event < ActiveRecord::Base
  belongs_to :host, class_name: 'User'
  has_many :rsvps, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :users, through: :rsvps

  validates :game_title, presence: true
  validates :session_title, presence: true
  validates :address_title, presence: true
  validates :date_time, presence: true
  validates :address, presence: true

  if Rails.env == 'production'
    # Order upcoming events by ascending
    scope :upcoming, -> { all.where('date_time >= ?', Time.zone.today).order(date_time: :asc) }
    # Order past events by descending
    scope :past, -> { all.where('date_time < ?', Time.zone.today).order(date_time: :desc) }
  else
    # Order upcoming events by ascending
    scope :upcoming, -> { all.where('date_time >= ?', Time.zone.today).order(date_time: :asc) }
    # Order past events by descending
    scope :past, -> { all.where('date_time < ?', Time.zone.today).order(date_time: :desc) }
  end

end
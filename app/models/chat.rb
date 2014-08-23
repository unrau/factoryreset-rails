class Chat < ActiveRecord::Base
  belongs_to :user

  time_from_now = Time.zone.now + 1.week

  default_scope { order(created_at: :asc) }
  scope :one_week_young, -> { all.where('created_at <= ?', time_from_now).order(created_at: :asc) }
end

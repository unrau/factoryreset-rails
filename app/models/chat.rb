class Chat < ActiveRecord::Base
  belongs_to :user

  default_scope { order(created_at: :asc) }
  scope :one_week_young, -> { all.where('created_at <= ?', (Time.zone.today + 1.week)).order(created_at: :asc) }
end

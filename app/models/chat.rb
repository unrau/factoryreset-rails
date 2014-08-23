class Chat < ActiveRecord::Base
  belongs_to :user

  old_time = Time.zone.now - 1.week

  default_scope { order(created_at: :asc) }
  scope :one_week_young, -> { all.where('created_at >= ?', old_time).order(created_at: :asc) }
end

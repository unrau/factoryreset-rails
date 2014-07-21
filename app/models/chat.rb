class Chat < ActiveRecord::Base
  belongs_to :user

  default_scope { order(created_at: :asc) }
  scope :one_month_young, -> { all.where('created_at <= ?', Time.zone.today + 1.month).order(created_at: :asc) }
end

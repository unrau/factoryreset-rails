class Chat < ActiveRecord::Base
  belongs_to :user

  old_time = Time.zone.now - 2.weeks

  default_scope { order(created_at: :asc) }
  scope :newest, -> { all.where('created_at >= ?', old_time).order(created_at: :asc) }
end

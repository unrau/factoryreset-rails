class Comment < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  # TODO: did this work?
  scope :each, ->{ all.order(:created_at) }
end

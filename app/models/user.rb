class User < ActiveRecord::Base

  validates :username, presence: true
  validates :email, presence: true
  validates :telephone, presence: true
  validates :colour, presence: true
  validates :picture, presence: true

end

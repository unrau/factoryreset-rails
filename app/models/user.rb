class User < ActiveRecord::Base
  before_save { self.username = username.downcase }
  before_save { self.email = email.downcase }

  validates :username, presence: true,
                       uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  validates :telephone, presence: true,
                        uniqueness: true
  validates :colour, presence: true
  validates :picture, presence: true,
                      uniqueness: true

end

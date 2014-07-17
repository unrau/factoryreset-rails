class User < ActiveRecord::Base
  has_many :comments
  has_many :chats

  before_save { self.username = username.downcase.gsub(/\s+/, '_') }
  before_save { self.email = email.downcase }
  before_create :create_remember_token

  validates :username, presence: true,
                       uniqueness: true
  # Allow only a valid email address
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  validates :telephone, presence: true,
                        uniqueness: true
  validates :colour, presence: true
  validates :picture, presence: true,
                      uniqueness: true

  has_secure_password

  scope :all_by_name, ->{ all.order(:username) }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end

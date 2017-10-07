class User < ActiveRecord::Base
  has_many :posts
  validates :username, presence: true, uniqueness: true, length: { minimum: 4, maximum: 16}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
  validates :password, presence: true, length: { minimum: 8, maximum: 30}
  has_secure_password
end

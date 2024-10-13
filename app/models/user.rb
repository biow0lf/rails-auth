class User < ApplicationRecord
  MINIMUM_PASSWORD_LENGTH = 8

  has_secure_password

  validates :password, length: {minimum: MINIMUM_PASSWORD_LENGTH}

  validates :email, presence: true

  validates :email, uniqueness: true

  normalizes :email, with: ->(email) { email.strip.downcase }

  has_many :sessions, dependent: :destroy

  generates_token_for :reset_password, expires_in: 1.hour do
    password_salt.last(10)
  end
end

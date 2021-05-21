class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :posts
  has_many :comments
  has_many :votes
  has_many :subscriptions
  has_many :boards, through: :subscriptions
end

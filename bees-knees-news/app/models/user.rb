class User < ActiveRecord::Base
  has_many :comments
  has_many :posts
  has_secure_password

  validates :username, presence: true
end

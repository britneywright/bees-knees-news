class User < ActiveRecord::Base
  has_secure_password
  has_many :comments
  has_many :posts
  has_many :post_votes
  has_many :comment_votes

  validates :username, presence: true
end

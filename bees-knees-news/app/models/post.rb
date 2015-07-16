class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  validates :title, :link, presence: true
  validates :link, uniqueness: true
end

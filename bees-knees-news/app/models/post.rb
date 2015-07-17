class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  has_many :post_votes
  has_many :comment_votes, through: :comments

  validates :title, :link, presence: true
  validates :link, uniqueness: true

  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :comment_votes

  def points
    self.post_votes.where(upvote: true).count
  end
end

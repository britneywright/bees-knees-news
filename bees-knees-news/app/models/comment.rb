class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_many :comment_votes

  validates :body, presence: true

  def points
    self.comment_votes.where(upvote: true).count
  end  
end

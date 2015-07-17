class PostVote < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  #validates :user, uniqueness: true, scope: :post
end

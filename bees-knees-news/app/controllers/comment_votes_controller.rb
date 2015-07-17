class CommentVotesController < ApplicationController
  def create
    post = Post.find_by(id: params[:post_id])
    comment = Comment.find_by(id: params[:comment_id])
    comment_vote = CommentVote.new(comment_id: params[:comment_id], user: current_user)
    if comment_vote.save
      redirect_to comment.post, notice: "Upvoted!"
    else
      redirect_to comment.post
    end
  end

  private

  def comment_vote_params
    params.require(:comment_vote).permit(:upvote)
  end
end

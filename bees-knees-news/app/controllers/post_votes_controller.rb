class PostVotesController < ApplicationController
  def create
    post = Post.find_by(id: params[:post_id])
    post_vote = PostVote.new(post: post, user: current_user)
    respond_to do |format|
      if post_vote.save
        format.js { render post }
      else
        redirect_to post, notice: "Vote not saved"
      end
    end
  end

  private

  def comment_vote_params
    params.require(:comment_vote).permit(:upvote)
  end
end

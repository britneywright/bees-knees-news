class PostVotesController < ApplicationController

  def show
    @post_vote = PostVote.find_by(id: params[:id])
  end

  def create
    post_vote = PostVote.new(post_id: params[:post_vote][:post_id], user: current_user)
    post = Post.find_by(id: params[:post_vote][:post_id])
    if post_vote.save && request.xhr?
      @points = post.points
      render json: {points: @points}.to_json
    else
      redirect_to post, notice: "Vote not saved"
    end
  end

  private

  def comment_vote_params
    params.require(:comment_vote).permit(:upvote)
  end
end

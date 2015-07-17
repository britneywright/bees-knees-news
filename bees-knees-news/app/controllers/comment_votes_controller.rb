class CommentVotesController < ApplicationController
  def create
    comment = Comment.find_by(id: params[:comment_id])
    comment_vote = CommentVote.new(comment_id: params[:comment_id], user: current_user)
    if comment_vote.save &&  request.xhr?
      @points = comment.points
      render json: {points: @points}.to_json
    else
      redirect_to comment.post
    end
  end

  private

  def comment_vote_params
    params.require(:comment_vote).permit(:upvote)
  end
end

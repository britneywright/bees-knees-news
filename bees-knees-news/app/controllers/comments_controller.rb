class CommentsController < ApplicationController
  def new
    authorize
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.new
    if request.xhr?
      render partial: 'form', layout: false
    end
  end

  def create
    post = Post.find_by(id: params[:post_id])
    comment = Comment.new(comment_params)
    comment_vote = CommentVote.new
    comment.post = post
    comment.user = current_user
    if comment.save && request.xhr?
      render partial: "comment", locals: {comment: comment, comment_vote: comment_vote, post: post}
    else
      flash[:errors] = comment.errors.full_messages
      redirect_to post
    end
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
  end

  def update
    comment = Comment.find_by(id: params[:id])
    if comment.update(comment_params)
      redirect_to post(comment.post), notice: "Comment updated successfully"
    else
      flash[:errors] = comment.errors.full_messages
      redirect_to post(comment.post)
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    comment.destroy
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end
end

class CommentsController < ApplicationController
  def new
    authorize
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.new
  end

  def create
    post = Post.find_by(id: params[:post_id])
    comment = Comment.new(comment_params)
    comment.post = post
    comment.user = current_user
    if comment.save && request.xhr?
      render json: {comment: comment}.to_json
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
    # use the next line in conjunction with the private method find_comment
    # comment = find_comment
    comment.destroy
    redirect_to root_path
  end

  private
  # Another way of doing things besides using a before_action
  # def find_comment
  #   Comment.find_by(id: params[:id])
  # end

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end
end

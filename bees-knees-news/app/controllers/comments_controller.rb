class CommentsController < ApplicationController
  def index
    @comments = Comments.all
  end

  def new
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.new
  end

  def create
    post = Post.find_by(id: params[:post_id])
    user = User.find_by(id: sessions[:user_id])
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to post, notice: "Comment added successfully!"
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

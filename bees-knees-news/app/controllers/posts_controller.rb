class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comment_vote = CommentVote.new
    @post_vote = PostVote.new
  end

  def new
    authorize
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user = current_user
    if post.save
      redirect_to post, notice: "Post created successfully!"
    else
      flash[:errors] = post.errors.full_messages
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      redirect_to post, notice: "Post updated successfully!"
    else
      flash[:errors] = post.errors.full_messages
      redirect_to edit_post_path(@post)
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :link, :user_id, comment_vote: [:upvote])
  end
end

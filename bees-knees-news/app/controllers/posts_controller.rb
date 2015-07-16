class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    # @user = User.find_by(id: sessions[:id])
    @post = Post.new
  end

  def create
    @user = User.find_by(id: sessions[:id])
    @post = Post.new(post_params)
    if @post.save
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
    @post = Post.find_by(post_params)
    if @post.save
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
    params.require(:post).permit(:title, :link, :user_id)
  end
end

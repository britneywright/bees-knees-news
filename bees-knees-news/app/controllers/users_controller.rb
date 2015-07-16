class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def comments
    @user = User.find_by(id: params[:id])
    @comments = @user.comments
  end

  def submissions
    @user = User.find_by(id: params[:id])
    @submissions = @user.posts
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user, notice: "User created successfully!"
    else
      flash[:errors] = user.errors.full_messages
      redirect_to login_path
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to user, notice: "User updated successfully!"
    else
      flash[:errors] = User.errors.full_messages
      redirect_to edit_User_path(@user)
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username,:password,:about)
  end
end

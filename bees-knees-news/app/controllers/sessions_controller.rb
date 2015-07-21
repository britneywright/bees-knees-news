class SessionsController < ApplicationController
  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user, notice: "Welcome back!"
    else
      redirect_to login_path, notice: "Try again"
    end
  end

  def logout
    session[:user_id] = nil
    # session.delete(:user_id) <-- removes the key entirely instead of setting it to nil
    redirect_to root_path, notice: "Logged out successfully!"
  end
end

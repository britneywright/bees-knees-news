class StaticPagesController < ApplicationController
  def login
    @user = User.new
  end
end

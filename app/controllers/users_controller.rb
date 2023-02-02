class UsersController < ApplicationController
  def index
    @users = User.all.order('created_at DESC')
  end

  def show
    @user = User.includes(:posts).find(params[:id])
  end
end

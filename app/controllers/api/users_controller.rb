class Api::UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end
end

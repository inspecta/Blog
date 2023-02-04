class Api::PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @posts = User.find(params[:user_id]).posts
    render json: @posts
  end

  def show; end
end

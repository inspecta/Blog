class Api::CommentsController < ApplicationController
  before_action :current_post, only: [:index]
  before_action :find_author, only: [:index]
  skip_before_action :authenticate_user!, only: %i[index show create new]
  skip_before_action :verify_authenticity_token
  def index
    comments = @post.comments.where(author_id: @user.id)
    render json: comments
  end

  def show; end

  def create
    @comment = Comment.new(post_id: params[:post_id], author_id: params[:user_id], **comment_params)
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end
  # Get current post

  private

  def find_author
    @user = User.find(params[:user_id])
  end

  def current_post
    @post = Post.find(params[:post_id])
  end

  # Parameters
  def comment_params
    params.require(:comment).permit(:text)
  end
end

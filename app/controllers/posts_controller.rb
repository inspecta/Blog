class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    user_id = params[:user_id]
    @user = User.find(user_id)
    @posts = @user.posts.order(created_at: :desc)
  end

  def show
    # URL parameters
    user_id = params[:user_id]
    post_id = params[:id]

    @user = User.find(user_id)
    @post = @user.posts.find(post_id)
    @comments = @post.comments.order(created_at: :desc)
    @likes = @post.likes.all
  end

  # Create a new post
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(author_id: current_user.id, **post_params, comments_counter: 0, likes_counter: 0)

    if @post.save
      flash[:success] = 'Post was successfully created.'
      redirect_to "/users/#{@post.author_id}/posts/"
    else
      flash.now[:error] = 'Oops. Something went wrong'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

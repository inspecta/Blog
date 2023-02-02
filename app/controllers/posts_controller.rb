class PostsController < ApplicationController
  def index
    user_id = params[:user_id]
    @user = User.includes(posts: [:comments]).find(user_id)
  end

  def show
    author_id = params[:user_id]
    post_id = params[:id]
    @user = User.find(author_id)
    @post = @user.posts.includes(:comments, :likes).find(post_id)
  end

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

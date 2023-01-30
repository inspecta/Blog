class LikesController < ApplicationController
  def create
    author = params[:user_id]
    post = params[:post_id]
    like = Like.new(author_id: author, post_id: post)

    if like.save
      flash[:success] = 'Like added'
      redirect_to user_post_path(author, post)
    else
      flash.now[:error] = 'Oops, something went wrong'
    end
  end
end

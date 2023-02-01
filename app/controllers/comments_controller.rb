class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = Comment.new(post_id: params[:post_id], author_id: current_user.id, **comment_params)

    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to user_post_path(params[:user_id], params[:post_id])
    else
      flash.now[:error] = 'Error: Couldnot create comment'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

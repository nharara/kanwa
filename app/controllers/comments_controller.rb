class CommentsController < ApplicationController

  def index
    @comments = Comment.all
    # @comment.post = @post
    # @comment.user = @user
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.post = @post
    @comment.user = current_user
    if @comment.save
      redirect_to posts_path
    else
      render '/posts', status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end

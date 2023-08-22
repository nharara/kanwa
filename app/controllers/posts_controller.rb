class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @posts = Post.order(created_at: :desc, title: :asc)

    @posts = @posts.where("title ILIKE ?", "%#{params[:query]}%") if params[:query].present?

    respond_to do |format|
      format.html
      format.json { render json: @posts }
      format.text { render partial: "posts/posts", locals: { posts: @posts }, formats: [:html] }
    end

    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to posts_path
    else
      render :index, status: :unprocesable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end

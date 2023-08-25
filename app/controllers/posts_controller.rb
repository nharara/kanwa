class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @posts = Post.order(created_at: :desc, title: :asc)
    # @posts = @posts.where("title ILIKE ?", "%#{params[:title]}%") if params[:title].present?
    @posts = @posts.joins(:emotion).where("posts.title ILIKE ? OR emotions.name ILIKE ?", "%#{params[:title]}%", "%#{params[:title]}%") if params[:title].present?
    @posts = @posts.includes([:emotion])
    @posts = @posts.includes([:user])
    @posts = @posts.includes([:comments])

    @comment = Comment.new

    respond_to do |format|
      format.html
      format.text { render partial: "posts/posts", locals: { posts: @posts }, formats: [:html] }
    end

    # @users = User.all
    # @comments = Comment.all

    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    emotion = Emotion.find(params[:entry][:specific_emotion_id])
    @post.emotion = emotion
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

class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @posts = Post.order(created_at: :desc, title: :asc)

    @posts = @posts.where("title ILIKE ?", "%#{params[:title]}%") if params[:title].present?

    respond_to do |format|
      format.html
      format.text { render partial: "posts/posts", locals: { posts: @posts }, formats: [:html] }
    end

    @users = User.all
    @comments = Comment.all
    @comment = Comment.new

    @post = Post.new
    @parent_emotions = Emotion.where(parent_emotion: nil)
    if params[:query].present?
      respond_to do |format|
        format.html # Follow regular flow of Rails
        @child_emotions = Emotion.find(params[:query]).child_emotions if params[:query]
        format.text { render partial: "entries/new_child", locals: { emotions: @child_emotions }, formats: [:html] }
      end
    end
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

class EntriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @entries = Entry.where(user: current_user).order("created_at DESC")
    @entries = @entries.search_by_sac(params[:query]) if params[:query].present?
    @entries = @entries.where("created_at >= ? and created_at <= ?", *params[:datefilter].split(" to ")) if params[:datefilter].present?
    # raise
    @entries = @entries.includes([:emotion])
    @entry = Entry.new
    @pagy, @entries = pagy(@entries)


    date = Date.today
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "kanwa #{date}", template: "entries/_entries", formats: [:html]
      end
    end

  end

  def new
    @entry = Entry.new
    @parent_emotions = Emotion.where(parent_emotion: nil)
    respond_to do |format|
      format.html # Follow regular flow of Rails
      @child_emotions = Emotion.find(params[:query]).child_emotions if params[:query]
      format.text { render partial: "entries/new_child", locals: { emotions: @child_emotions }, formats: [:html] }
    end
  end

  def create
    @entry = Entry.new
    @entry.situation = entry_params[:situation]
    @entry.emotion = Emotion.find(entry_params[:specific_emotion_id])
    @entry.action = entry_params[:action]
    @entry.consequence = entry_params[:consequence]
    @entry.user = current_user
    if @entry.save
      redirect_to entries_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def entry_params
    params.require(:entry).permit(:situation, :action, :consequence, :specific_emotion_id)
  end

  def pdf_params
    params.require(:query)
    params.require(:datafilter)
  end
end

# make array of emotions from user input

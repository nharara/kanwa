class EntriesController < ApplicationController
  def index
  end

  def new
    @entry = Entry.new
  end

  def create
    @emotions = Emotion.all
    @entries = Entry.all
    @emotion = Emotion.find_by_id()
    @entry = Entry.new(entry_params)
    @entry.emotion = @emotion
    @entry.user = current_user
    if @entry.save
      redirect_to entry_path(@entry)
    else
      render :index, status: :unprocessable_entity
    end
  end

  emotion.parent_emotion

  def show
  end

  private

  def emotion_params
    params.require(:entry).permit(
  end

  def
end

# make array of emotions from user input
#

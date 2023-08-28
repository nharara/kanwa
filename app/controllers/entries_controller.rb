class EntriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @entries = Entry.where(user: current_user).order("created_at DESC")

    if params[:query].present?
      @entries = @entries.search_by_sac(params[:query])

      g1 = @entries.group_by {|entry| entry.emotion}

      g2 = g1.transform_values {|entries| entries.group_by {|entry| entry.situation.split(":").first}}
      @g3 = g2.transform_values {|situations| situations.transform_values {|entries| entries.count}}

      @action = @entries.group_by {|entry| entry.action}.transform_values {|value| value.count}
      @total = @action.values.sum
      @yes_action = @action["Yes"]
      @yes_percentage = ((@yes_action.fdiv(@total))*100).round

    end
    @entries = @entries.search_by_sac(params[:query]) if params[:query].present?
    @entries = @entries.where("created_at >= ? and created_at <= ?", *params[:datefilter].split(" to ")) if params[:datefilter].present?
   
    # raise
    @parent_emotions = Emotion.where(parent_emotion: nil)
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
    @entry = Entry.new(entry_params.except(:specific_emotion_id))

    @entry.emotion = Emotion.find(entry_params[:specific_emotion_id])

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
    params.require(:entry).permit(:situation, :action, :consequence, :specific_emotion_id, :situation_details)
  end

  def pdf_params
    params.require(:query)
    params.require(:datafilter)
  end

  def action_count(entries)
    yes = 0
    no = 0
    entries.each do |entry|
      if entry.action == "Yes"
         yes += 1
      else
        no +=1
      end
    end
    return{yes: yes, no: no}
  end
end
# make array of emotions from user input

# group the entries by emotion
# for each entry in each emotion we find the situation
# count the sitaution, display

require 'google/apis/youtube_v3'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    days = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su']
    @entries_by_date = current_user.entries.where('created_at BETWEEN ? AND ?', Date.today.beginning_of_day - 30.days, Date.today.end_of_day).order(:created_at).group_by {|entry|entry.created_at.beginning_of_week.to_date }.to_h
    @entries_by_date.each do |week, entries|
      @entries_by_date[week] = days.map do |day|
        { x: day, y: entries.select { |entry| entry.created_at.strftime('%a')[0, 2] == day || (entry.created_at.strftime('%a')[0, 2] + '*') == day }.count}
      end
    end



    @entries = Entry.where(user: current_user)
                    .where('entries.created_at BETWEEN ? AND ?', Date.today.beginning_of_day - 15.days, Date.today.end_of_day)
                    .order(:created_at)

    @entries_by_day = @entries.group_by { |entry| entry.created_at.to_date }

    @yes_data = @entries_by_day.transform_values { |entries| entries.count { |entry| entry.action == "Yes" } }
    @no_data = @entries_by_day.transform_values { |entries| entries.count { |entry| entry.action == "No" } }



    #count yes for each day

    @percentage_data = @yes_data.map.with_index { |data, i| [data[0], data[1] / (data[1] + @no_data.values[i]) * 100] }.to_h

    @actions_data = [{ name: 'Controlled action', data: @yes_data }, { name: 'Uncontrolled action', data: @no_data }]

    @emotions_data = Emotion
                            .joins(child_emotions: { entries: :user })
                            .where('entries.user_id' => current_user.id)
                            .where('entries.created_at BETWEEN ? AND ?', Date.today.beginning_of_day - 30.days, Date.today.end_of_day)
                            .group('emotions.name')
                            .select('emotions.name, COUNT(entries.id) as entry_count')
                            .each_with_object({}) do |emotion, hash|
                              hash[emotion.name] = emotion.entry_count
                            end

    @top_emotion = Emotion
                          .joins(child_emotions: { entries: :user })
                          .where('users.id' => current_user.id)
                          .where('entries.created_at BETWEEN ? AND ?', Date.today.beginning_of_day - 30.days, Date.today.end_of_day)
                          .group('emotions.id')
                          .select('emotions.name, emotions.id, COUNT(entries.id) as entry_count')
                          .order('entry_count DESC')
                          .first

    if @top_emotion.present?
      @emotion = Emotion.find_by(name: @top_emotion.name)
      stats(@emotion.child_entries.where(user: current_user).where('entries.created_at BETWEEN ? AND ?', Date.today.beginning_of_day - 30.days, Date.today.end_of_day))
      @top_emotion_name = @top_emotion.name
    else
      # Handle the case where @top_emotion is nil
      @emotion = nil
      @top_emotion_name = 'No Top Emotion Found'


    @greeting_message = greeting

  end
end

  ["angry", "disgusted", "fearful", "bad", "surprised", "happy", "sad"]

  def greeting
    current_time = Time.zone.now
    case current_time.hour
    when 5..11
      "Good morning"
    when 12..16
      "Good afternoon"
    when 17..20
      "Good evening"
    when 21..23, 0..4
      "Good night"
    else
      "Hi"
    end
  end

  def videos
    @entry = current_user.entries.last

    if @entry && @entry.emotion
      youtube = Google::Apis::YoutubeV3::YouTubeService.new
      youtube.key = 'AIzaSyB5ywnOhgcW8Q-isywzjYcwLaSAomiNc70' # See Googleauth or Signet libraries
      query = "#{@entry.emotion.name} #{@entry.situation}"
      response = youtube.list_searches('snippet', channel_id: 'UClHVl2N3jPEbkNJVx-ItQIQ', max_results: 4, type: 'video', q: query)
      @video_ids = response.items.map { |item| item.id.video_id }
    else
      # Handle the case where @entry or @entry.emotion is nil
      @video_ids = []
    end
  end

end
# 'Mo*', 'Tu*', 'We*', 'Th*', 'Fr*', 'Sa*', 'Su*',

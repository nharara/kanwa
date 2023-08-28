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
                    .where('entries.created_at BETWEEN ? AND ?', Date.today.beginning_of_day - 30.days, Date.today.end_of_day)
                    .order(:created_at)

    @entries_by_day = @entries.group_by { |entry| entry.created_at.to_date }

    @yes_data = @entries_by_day.transform_values { |entries| entries.count { |entry| entry.action == "Yes" } }
    @no_data = @entries_by_day.transform_values { |entries| entries.count { |entry| entry.action == "No" } }

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
                          .group('emotions.name')
                          .select('emotions.name, COUNT(entries.id) as entry_count')
                          .order('entry_count DESC')
                          .first


    @top_situation = @top_emotion.child_entries.where(user: current_user).group(:situation).count.max_by{ |situation, count| count }.first

    @top_emotion_name = @top_emotion.name
    # @top_emotion_situation = @top_emotion.situation

    @greeting_message = greeting

  end

  def greeting
    current_time = Time.now
    case current_time.hour
    when 5..11
      "Good morning, "
    when 12..16
      "Good afternoon, "
    when 17..20
      "Good evening, "
    when 21..23, 0..4
      "Good night, "
    else
      "Hi "
    end
  end
end
# 'Mo*', 'Tu*', 'We*', 'Th*', 'Fr*', 'Sa*', 'Su*',

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    days = [ 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su']
    @entries_by_date = current_user.entries.where("created_at <= ? and created_at > ?", Date.today, Date.today - 30).order(:created_at).group_by {|entry|entry.created_at.beginning_of_week.to_date }.to_h
    @entries_by_date.each do |week, entries|
      @entries_by_date[week] = days.map do |day|
        { x: day, y: entries.select { |entry| entry.created_at.strftime('%a')[0, 2] == day || (entry.created_at.strftime('%a')[0, 2] + '*') == day }.count}
      end
    end

    @entries = Entry.where(user: current_user)
                    .where("created_at <= ? and created_at > ?", Date.today, Date.today - 30)
                    .order(:created_at)

    @entries_by_day = @entries.group_by { |entry| entry.created_at.to_date }

    @yes_data = @entries_by_day.transform_values { |entries| entries.count { |entry| entry.action == "Yes" } }
    @no_data = @entries_by_day.transform_values { |entries| entries.count { |entry| entry.action == "No" } }

    @actions_data = [{ name: 'Opposite Action To Emotion', data: @yes_data }, { name: 'Acted Emotionally', data: @no_data }]

    @emotions_data = Entry.joins(:emotion).where(user: current_user).where(emotion: { parent_emotion: nil }).group(:name).count

  end
end
# 'Mo*', 'Tu*', 'We*', 'Th*', 'Fr*', 'Sa*', 'Su*',

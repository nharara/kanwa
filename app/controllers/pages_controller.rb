class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    days = ['Mon', 'Tues', 'Wed', 'Thurs', 'Fri', 'Sat', 'Sun']
    @entries_by_date = current_user.entries.where("created_at <= ? and created_at > ?", Date.today, Date.today - 30).order(:created_at).group_by {|entry|entry.created_at.beginning_of_week.to_date }.to_h
    @entries_by_date.each do |week, entries|
      @entries_by_date[week] = days.map do |day|
        { x: day, y: entries.select { |entry| entry.created_at.strftime('%a') == day }.count }
      end
    end

    @entries = Entry.all
    # turn entries into entries_by_day
    @entries_by_day = @entries.group_by { |entry| entry.created_at.to_date }
    # by each entry by day, count yes and no
    # insert data into yes_data and no_data
    @yes_data = @entries_by_day.transform_values { |entries| entries.count { |entry| entry.action == "Yes" } }
    @no_data = @entries_by_day.transform_values { |entries| entries.count { |entry| entry.action == "No" } }


    @data = [{name: 'yes', data: @yes_data},{name: 'no', data: @no_data}]
  end
end

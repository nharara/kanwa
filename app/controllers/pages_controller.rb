class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    days = ['Mo*', 'Tu*', 'We*', 'Th*', 'Fr*', 'Sa*', 'Su*', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su']
    @entries_by_date = current_user.entries.where("created_at <= ? and created_at > ?", Date.today, Date.today - 60).order(:created_at).group_by {|entry|entry.created_at.beginning_of_week.to_date }.to_h
    @entries_by_date.each do |week, entries|
      @entries_by_date[week] = days.map do |day|
        { x: day, y: entries.select { |entry| entry.created_at.strftime('%a')[0, 2] == day || (entry.created_at.strftime('%a')[0, 2] + '*') == day }.count}
      end
    end
    # raise
  end
end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @entries_by_date = current_user.entries.group_by {|entry|entry.created_at.to_date}.to_h
  end
end

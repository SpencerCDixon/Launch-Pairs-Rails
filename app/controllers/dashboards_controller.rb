class DashboardsController < ApplicationController
  before_action :authenticate

  def show
    if params[:query] == "pair"
      @users = User.ready_to_pair
    elsif params[:query] == "help"
      @users = User.open_to_help
    elsif params[:query] == "lucky"
      @users = User.feeling_lucky(current_user)
    else
      @users = User.all.limit(20)
    end

    @feed = Dashboard.display_feed
  end

end

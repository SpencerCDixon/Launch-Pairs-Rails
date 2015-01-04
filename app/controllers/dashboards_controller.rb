class DashboardsController < ApplicationController
  before_action :authenticate

  def show
    if params[:query] == "pair"
      @users = User.ready_to_pair
    else
      @users = User.all.limit(20)
    end
  end
end

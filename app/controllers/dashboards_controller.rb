class DashboardsController < ApplicationController
  before_filter :authenticate

  def show
    @users = User.all.limit(20)
  end
end

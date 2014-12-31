class DashboardsController < ApplicationController
  before_action :authenticate

  def show
    @users = User.all.limit(20)
  end
end

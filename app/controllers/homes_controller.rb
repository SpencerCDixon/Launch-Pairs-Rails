class HomesController < ApplicationController
  before_action :authenticate

  # will need to change tests to be looking at dashboard instead of index
  def index
    @users = User.all.limit(20)
  end
end

class HomesController < ApplicationController
  before_filter :authenticate

  def index
    @users = User.all.limit(20)
  end
end

class ProfilesController < ApplicationController
  before_action :authenticate, only: :show

  def show
    @user = User.find(params[:user_id])
    @status = Status.new
    @project = Project.new
  end
end

class StatusesController < ApplicationController
  def create
    @status = Status.new(status_params)
    @status.user = current_user
    @status.save
    redirect_to user_profile_path(current_user), success: "Status updated"
  end

  private

  def status_params
    params.require(:status).permit(:description)
  end
end

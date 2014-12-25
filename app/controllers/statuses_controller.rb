class StatusesController < ApplicationController
  def create
    @status = Status.new(status_params)
    @status.user = current_user

    if @status.save
      redirect_to user_profile_path(current_user), notice: "Status updated"
    else
      render 'profile#show'
    end
  end


  private
  def status_params
    params.require(:status).permit(:description)
  end
end

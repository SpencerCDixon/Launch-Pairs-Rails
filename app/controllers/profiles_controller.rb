class ProfilesController < ApplicationController
  before_action :authenticate

  def show
    @user = User.find(params[:user_id])
    @status = Status.new
    @project = Project.new
    @profile = @user.profile
  end

  def new
    @user = current_user
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = params[:user_id]

    if @profile.save
      flash[:notice] = "Profile information updated."
      redirect_to user_profile_path(params[:user_id])
    else
      flash[:notice] = "Something went wrong with creating your profile"
    end
  end

  def edit
  end

  private

  def profile_params
    params.require(:profile).permit(:blog_url, :facebook, :twitter, :github, :linked_in, :phone_number, :email)
  end
end

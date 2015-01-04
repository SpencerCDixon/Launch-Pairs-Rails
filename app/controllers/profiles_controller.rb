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
    @profile.user_id = current_user

    if @profile.save
      flash[:notice] = "Profile information updated."
      redirect_to user_profile_path(params[:user_id])
    else
      render 'new'
    end
  end

  def edit
    @profile = Profile.find_by(user_id: params[:user_id])
  end

  def update
    @profile = Profile.find_by(user_id: params[:user_id])
    if @profile.update(profile_params)
      flash[:notice] = "Profile successfully updated"
      redirect_to user_profile_path(current_user)
    else
      render 'edit'
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:blog_url, :facebook, :twitter, :github, :linked_in, :phone_number, :email)
  end
end

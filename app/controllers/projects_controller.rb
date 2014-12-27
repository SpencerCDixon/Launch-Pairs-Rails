class ProjectsController < ApplicationController
  def create
    @project = current_user.projects.new(project_params)

    if @project.save
      redirect_to user_profile_path(current_user), 
        notice: "Project updated"
    else
      render 'profile#show'
    end
  end

  private
  def project_params
    params.require(:project).permit(:project)
  end
end

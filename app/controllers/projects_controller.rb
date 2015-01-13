class ProjectsController < ApplicationController
  def create
    @project = current_user.projects.new(project_params)

    if @project.save
      redirect_to user_profile_path(current_user), 
        success: "Project updated"
    else
      flash[:warning] = "Project can't be blank!"
      redirect_to :back
    end
  end

  private
  def project_params
    params.require(:project).permit(:project)
  end
end

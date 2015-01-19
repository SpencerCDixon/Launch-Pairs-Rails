class StudentRegistration

  DEFAULT_STATUS = "Sleeping"
  DEFAULT_PROJECT = "In deep thought"

  def initialize(user)
    @user = user
  end

  def create_dependencies(status = DEFAULT_STATUS, project = DEFAULT_PROJECT)
    @user.statuses.create!(description: status)
    @user.projects.create!(project: project)
  end
end

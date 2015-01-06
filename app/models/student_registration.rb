class StudentRegistration

  DEFAULT_STATUS = "Sleeping"
  DEFAULT_PROJECT = "In deep thought"

  def initialize(user)
    @user = user
  end

  def create_dependencies
    @user.statuses.create!(description: DEFAULT_STATUS)
    @user.projects.create!(project: DEFAULT_PROJECT)
  end
end

class Project < ActiveRecord::Base
  belongs_to :user
  validates :project, presence: true

  def project
    self[:project] || "In deep thought"
  end
end

class Project < ActiveRecord::Base
  belongs_to :user
  validates :project, presence: true
end

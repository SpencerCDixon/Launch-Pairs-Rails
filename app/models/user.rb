class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :statuses
  has_many :projects

  def current_status
    if !statuses.empty?
      statuses.last.description 
    else
     "Sleeping"
    end
  end

  def current_project
    if !projects.empty?
      projects.last.project
    else
      "In deep thought"
    end
  end
end


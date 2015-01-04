class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :statuses
  has_many :projects
  has_many :pairings
  has_one :profile

  # Testing adding a custom has_on association:
  has_one :latest_status, -> { order('created_at desc') }, class_name: 'Status', dependent: :destroy
  # This works but breaks my views b/c they call on nil.  Need a way to create an empty status everytime a user gets created.

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

  # Should be refactored
  def paired_with?(user)
    pairings.where(pair_id: user.id).exists?
  end

  def self.ready_to_pair
    users = []
    User.all.each do |user|
      if user.current_status == "Ready To Pair"
        users << user
      end
    end
    users
  end

  def self.open_to_help
    users = []
    User.all.each do |user|
      if user.current_status == "Open To Help"
        users << user
      end
    end
    users
  end

  def percent_paired_with
    count = User.count - 1
    pairings = self.pairings.count
    total = pairings.to_f / count.to_f
    total.round(2) * 100
  end
end


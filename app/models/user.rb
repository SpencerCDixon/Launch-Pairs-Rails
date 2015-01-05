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
    !statuses.empty? ? statuses.last.description : statuses.new.description
  end

  def current_project
    !projects.empty? ? projects.last.project : projects.new.project
  end

  # Should be refactored
  def paired_with?(user)
    pairings.where(pair_id: user.id).exists?
  end

  def self.ready_to_pair
    users = []
    all.each do |user|
      users << user  if user.current_status == "Ready To Pair"
    end
    users
  end

  def self.open_to_help
    users = []
    all.each do |user|
      if user.current_status == "Open To Help"
        users << user
      end
    end
    users
  end

  def percent_paired_with
    students = User.count - 1
    pairings = self.pairings.count
    total = pairings.to_f / students.to_f
    total.round(2) * 100
  end

  def self.feeling_lucky(current_user)
    potential_people = []
    final_people = []

    # need to eliminate these N + 1 queries
    User.all.each do |user|
      if !current_user.paired_with?(user)
        potential_people << user
      end
    end

    potential_people.each do |user|
      if user.current_status == "Ready To Pair"
        final_people << user
      end
    end

    # Need to find a new way to return something if its empty
    if final_people.empty?
      [User.find_or_create_by(email: "notfound@sample.com")]
    else
      [final_people.sample]
    end
  end
end


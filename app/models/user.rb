class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :statuses

  def current_status
    if !statuses.empty?
      statuses.last.description 
    else
     "Sleeping"
    end
  end
end


class Status < ActiveRecord::Base
  belongs_to :user

  validates :description, inclusion: { in: [ 'Open To Help',
                                             'Ready To Pair',
                                             'In The Zone',
                                             'Sleeping' ] }

  def description
    self[:description] || "Sleeping"
  end
end

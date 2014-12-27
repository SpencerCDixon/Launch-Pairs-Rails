class Status < ActiveRecord::Base
  belongs_to :user

  validates :description, presence: true, inclusion: { in: ['Open To Help',
                                                            'Ready To Pair',
                                                            'In The Zone'] }
end

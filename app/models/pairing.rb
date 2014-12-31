class Pairing < ActiveRecord::Base
  validates_uniqueness_of :user_id, scope: [:pair_id]
  belongs_to :user
end

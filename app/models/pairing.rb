class Pairing < ActiveRecord::Base
  validates_uniqueness_of :user_id, scope: [:pair_id]
  validates :user_id, presence: true, numericality: true
  validates :pair_id, presence: true, numericality: true

  belongs_to :user
end

class Profile < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true, numericality: true
  validates :facebook, format: /\A(http|https)/
  validates :twitter, format: /\A(http|https)/
  validates :github, format: /\A(http|https)/
  validates :linked_in, format: /\A(http|https)/
  validates :blog_url, format: /\A(http|https)/
  validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/

end

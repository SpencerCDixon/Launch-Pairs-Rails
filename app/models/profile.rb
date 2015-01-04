class Profile < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true, numericality: true
  validates :facebook, format: /\A(http|https)/, allow_blank: true
  validates :twitter, format: /\A(http|https)/, allow_blank: true
  validates :github, format: /\A(http|https)/, allow_blank: true
  validates :linked_in, format: /\A(http|https)/, allow_blank: true
  validates :blog_url, format: /\A(http|https)/, allow_blank: true
  validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, allow_blank: true

end

class User < ApplicationRecord
  has_many :sessions, dependent: :destroy
  validates_uniqueness_of :email
  validates_format_of :email, with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\Z/i

  def logged_in?
    Session.where(user: self).exists?
  end
end

class User < ApplicationRecord
  has_many :sessions, dependent: :destroy
  has_one :preference, dependent: :destroy

  validates :email, presence: true, format: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\Z/i

  def logged_in?
    Session.where(user: self).exists?
  end
end

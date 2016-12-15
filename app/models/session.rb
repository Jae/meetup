class Session < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_secure_token
end

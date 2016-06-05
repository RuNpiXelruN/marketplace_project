class User < ActiveRecord::Base
  has_many :mentors, dependent: :destroy
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
end

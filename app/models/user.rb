class User < ApplicationRecord
  validates_presence_of :email, uniqueness: true
  validates_presence_of :password

  has_secure_password
end

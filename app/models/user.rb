class User < ApplicationRecord
  has_secure_password
  
  has_many :tasks

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 1 }
  validates :password_confirmation, presence: true, length: { minimum: 1 }
end
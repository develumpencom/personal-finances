class User < ApplicationRecord
  has_secure_password

  has_many :accounts
  has_many :movements, through: :accounts
  has_many :sessions, class_name: "Users::Session", dependent: :destroy
end

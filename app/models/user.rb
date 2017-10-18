class User < ApplicationRecord
  has_secure_password
  has_many :workouts, dependent: :destroy
  has_many :exercises, through: :workouts
  has_many :sets, through: :exercises

  validates_presence_of :name, :password, :email
end

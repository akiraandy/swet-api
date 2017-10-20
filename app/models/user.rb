class User < ApplicationRecord
  has_secure_password
  has_many :workouts, dependent: :destroy
  has_many :exercises, through: :workouts, dependent: :destroy
  has_many :sets, through: :exercises, dependent: :destroy

  validates_presence_of :name, :password, :email
end

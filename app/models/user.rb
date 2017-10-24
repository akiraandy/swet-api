class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  has_many :workouts, dependent: :destroy
  has_many :exercises, through: :workouts, dependent: :destroy
  has_many :sets, through: :exercises, dependent: :destroy
  has_many :reps, through: :sets

  validates_presence_of :password, :email
end

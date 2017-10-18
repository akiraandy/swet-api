class Workout < ApplicationRecord
  belongs_to :user
  has_many :exercises
  has_many :sets, through: :exercises
  has_many :reps, through: :sets

  validates_presence_of :title
end

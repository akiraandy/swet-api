class Workout < ApplicationRecord
  belongs_to :user
  has_many :exercises
  has_many :sets, through: :exercises, source: :batches
  has_many :reps, through: :sets
end

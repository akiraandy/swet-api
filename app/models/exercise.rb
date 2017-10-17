class Exercise < ApplicationRecord
  belongs_to :workout
  has_many :sets, source: :batches
  has_many :reps, through: :sets
end

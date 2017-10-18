class Exercise < ApplicationRecord
  belongs_to :workout
  has_many :sets, class_name: "Batch"
  has_many :reps, through: :sets
end

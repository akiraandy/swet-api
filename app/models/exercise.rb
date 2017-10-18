class Exercise < ApplicationRecord
  belongs_to :workout
  has_many :sets, class_name: "Batch"
  has_many :reps, through: :sets

  def avg_weight
    (self.reps.sum(:weight) / self.reps.count).round(2)
  end
end

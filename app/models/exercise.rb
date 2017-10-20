class Exercise < ApplicationRecord
  belongs_to :workout
  has_many :sets, class_name: "Batch", dependent: :destroy
  has_many :reps, through: :sets, dependent: :destroy

  validates :name, presence: true


  def avg_weight
    self.reps.average(:weight).to_f.round(2)
  end
end

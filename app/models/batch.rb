class Batch < ApplicationRecord
  belongs_to :exercise
  has_many :reps, dependent: :destroy
end

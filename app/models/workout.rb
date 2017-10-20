class Workout < ApplicationRecord
  belongs_to :user
  has_many :exercises, dependent: :destroy
  has_many :sets, through: :exercises, dependent: :destroy
  has_many :reps, through: :sets, dependent: :destroy

  validates_presence_of :title
end

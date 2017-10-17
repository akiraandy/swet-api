class Rep < ApplicationRecord
  belongs_to :set, class_name: "Batch", foreign_key: :batch_id

  validates_presence_of :weight
end

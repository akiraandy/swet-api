class CreateReps < ActiveRecord::Migration[5.1]
  def change
    create_table :reps do |t|
      t.float :weight
      t.references :batch, foreign_key: true

      t.timestamps
    end
  end
end

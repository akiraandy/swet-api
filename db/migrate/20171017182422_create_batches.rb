class CreateBatches < ActiveRecord::Migration[5.1]
  def change
    create_table :batches do |t|
      t.references :exercise, foreign_key: true

      t.timestamps
    end
  end
end

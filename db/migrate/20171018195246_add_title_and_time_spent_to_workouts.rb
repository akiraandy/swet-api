class AddTitleAndTimeSpentToWorkouts < ActiveRecord::Migration[5.1]
  def change
    add_column :workouts, :title, :string
    add_column :workouts, :time_spent, :datetime
  end
end

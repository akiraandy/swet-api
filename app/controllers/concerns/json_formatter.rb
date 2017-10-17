module JSONFormatter

  def format_workout(workout)

    { "workout_id" => workout.id,
      "exercises" => workout.exercises.map do |exercise|
                        exercise.name
                     end
    }
  end
end

module JSONFormatter

  def format_workout(workout)
    exercise_arr = []
    workout.exercises.each do |exercise|
      exercise_arr << { "name" => exercise.name, "sets" => exercise.sets.count, "total_reps" => exercise.reps.count}
    end
    { "workout_id" => workout.id,
      "exercises" => exercise_arr
    }
  end
end

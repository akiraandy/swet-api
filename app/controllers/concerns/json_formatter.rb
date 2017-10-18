module JSONFormatter

  def format_single_workout(workout)
    exercise_arr = []
    workout.exercises.each do |exercise|
      exercise_arr << { "name" => exercise.name, "sets" => exercise.sets.count, "total_reps" => exercise.reps.count}
    end
    { "workout_id" => workout.id,
      "exercises" => exercise_arr
    }
  end

  def format_all_workouts(workouts)
    workout_list = []
    workouts.each do |workout|
      workout_obj = {}
      workout_obj[:title] = workout.title
      workout_obj[:exercises] = []
      workout_list << workout_obj
      workout.exercises.each do |exercise|
        exercise_obj = {}
        exercise_obj[:name] = exercise.name
        exercise_obj[:sets] = exercise.sets.count
        exercise_obj[:reps] = exercise.reps.count
        exercise_obj[:avg_weight] = exercise.avg_weight
        workout_obj[:exercises] << exercise_obj
      end
    end
    JSON.generate(workout_list)
  end
end

module JSONFormatter

  def create_workout_hash(workout)
    workout_obj = {}
    workout_obj[:title] = workout.title
    workout_obj[:time_spent] = workout.time_spent
    workout_obj[:exercises] = []
    workout_obj
  end

  def create_exercise_hash(exercise)
    exercise_obj = {}
    exercise_obj[:name] = exercise.name
    exercise_obj[:sets] = exercise.sets.count
    exercise_obj[:reps] = exercise.reps.count
    exercise_obj[:avg_weight] = exercise.avg_weight
    exercise_obj
  end

  def workout_obj_with_exercises(workout, workout_obj)
    workout_obj[:exercises] = workout.exercises.map { |exercise| create_exercise_hash(exercise) }
  end

  def format_single_workout(workout)
    JSON.generate(workout_obj_with_exercises(workout, create_workout_hash(workout)))
  end

  def format_all_workouts(workouts)
    workout_list = []
    workouts.each { |workout| workout_list << workout_obj_with_exercises(workout, create_workout_hash(workout)) }
    JSON.generate(workout_list)
  end
end

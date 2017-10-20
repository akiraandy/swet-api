module JSONFormatter

  def create_workout_hash(workout)
    workout_obj = {}
    workout_obj[:title] = workout.title
    workout_obj[:time_spent] = workout.time_spent
    workout_obj[:exercises] = []
    workout_obj
  end

  def set_obj_array(exercise)
    set_array = []
    exercise.sets.each do |set|
      set_obj = {}
      set_obj[:set_id] = set.id
      set_obj[:reps] = rep_list(set)
      set_array << set_obj
    end
    set_array
  end

  def rep_list(set)
    rep_array = []
    set.reps.each do |rep|
      rep_obj = {}
      rep_obj[:rep_id] = rep.id
      rep_obj[:weight] = rep.weight
      rep_array << rep_obj
    end
    rep_array
  end

  def create_exercise_hash(exercise)
    exercise_obj = {}
    exercise_obj[:name] = exercise.name
    exercise_obj[:sets] = set_obj_array(exercise)
    exercise_obj[:reps] = exercise.reps.count
    exercise_obj[:avg_weight] = exercise.avg_weight
    exercise_obj
  end

  def create_array_of_exercises(exercises)
    exercises.map { |exercise| create_exercise_hash(exercise) }
  end

  def workout_obj_with_exercises(workout, workout_obj)
    workout_obj[:exercises] = create_array_of_exercises(workout.exercises)
    workout_obj
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

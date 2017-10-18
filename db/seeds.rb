User.create!(name: "Andy", password: "password", email: "andy@website.com")
User.create!(name: "Rhonda", password: "password", email: "rhonda@website.com")

User.all.each do |user|
  workout = Workout.create!(user: user)
  exercise = Exercise.create!(name: "Push-ups", workout: workout)
  3.times do
    batch = Batch.create!(exercise: exercise)
    8.times do
      batch.reps << Rep.create!(weight: 140.0, batch: b)
    end
    exercise.batches << batch
  end
  workout.exercises << exercise
  user.workouts << workout
  user.save!
end

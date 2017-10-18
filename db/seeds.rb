require 'faker'
User.create!(name: "Andy", password: Faker::Internet.password(8), email: "andy@website.com")
User.create!(name: "Rhonda", password: Faker::Internet.password(8), email: "rhonda@website.com")

User.all.each do |user|
  3.times do
    workout = Workout.create!(title: Faker::Dessert.variety, user: user)
    6.times do
      exercise = Exercise.create!(name: Faker::Superhero.power, workout: workout)
      3.times do
        set_weight =  1 + Random.rand(140)
        batch = Batch.create!(exercise: exercise)
        8.times do
          batch.reps << Rep.create!(weight: set_weight, set: batch)
        end
        exercise.sets << batch
      end
      workout.exercises << exercise
      user.workouts << workout
    end
  end
end

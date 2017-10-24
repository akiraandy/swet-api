FactoryGirl.factories.clear

FactoryGirl.define do

  factory :rep do
    weight { Faker::Number.number(100) }
    Batch
  end

  factory :batch do
    exercise

    factory :batch_with_reps do
      transient do
        reps_count 8
      end
      after(:create) do |batch, evaluator|
        create_list(:rep, evaluator.reps_count, set: batch)
      end
    end
  end

  factory :exercise do
    name { Faker::Superhero.power }
    workout

    factory :exercise_with_sets do
      transient do
        batch_with_reps_count 3
      end
      after(:create) do |exercise, evaluator|
        create_list(:batch_with_reps, evaluator.batch_with_reps_count, exercise: exercise)
      end
    end
  end

  factory :workout do
    title { Faker::Dessert.variety }
    user

    factory :workout_with_exercises do
      transient do
        exercise_with_sets_count 6
      end
      after(:create) do |workout, evaluator|
        create_list(:exercise_with_sets, evaluator.exercise_with_sets_count, workout: workout)
      end
    end
  end

  factory :user do
    email { Faker::Internet.email }
    password '12345678'
    password_confirmation '12345678'

    factory :user_with_workouts do
      transient do
        workout_with_exercises_count 10
      end
      after(:create) do |user, evaluator|
        create_list(:workout_with_exercises, evaluator.workout_with_exercises_count, user: user)
      end
    end
  end
end

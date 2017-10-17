FactoryGirl.define do

  factory :rep do
    weight { weight { Faker::Number.number(100) } }
    batch
  end

  factory :batch do
    exercise
  end

  factory :exercise do
    name { Faker::Superhero.power }
    workout
  end

  factory :workout do
    user

    factory :workout_with_exercises do
      transient do
        exercises_count 6
      end
      after(:create) do |workout, evaluator|
        create_list(:exercise, evaluator.exercises_count, workout: workout)
      end
    end
  end

  factory :user do
    name { Faker::Internet.user_name }
    password { Faker::Internet.password(8) }
    email { Faker::Internet.email }

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

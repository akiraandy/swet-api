class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :update, :destroy]
  before_action :set_workout, only: [:index, :create]

  def index
    json_response(create_array_of_exercises(@workout.exercises))
  end

  def show
    json_response(create_exercise_hash(@exercise))
  end

  def create
    @exercise = @workout.exercises.create!(exercise_params)
    json_response(@exercise, :created)
  end

  def update
    @exercise.update(exercise_params)
    head :no_content
  end

  def destroy
    @exercise.destroy
    head :no_content
  end

  private

  def exercise_params
    params.permit(:name)
  end

  def set_workout
    @workout = Workout.find(params[:workout_id])
  end

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end
end

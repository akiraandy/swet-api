class WorkoutsController < ApplicationController
  before_action :set_user, only: [:create, :index]
  before_action :set_workout, only: [:destroy, :update, :show]
  # GET /workouts
  def index
    json_response(format_all_workouts(@user.workouts))
  end

  def show
    json_response(format_single_workout(@workout))
  end

  def create
    @workout = @user.workouts.create!(workout_params)
    json_response(@workout, :created)
  end

  def update
    @workout.update(workout_params)
    head :no_content
  end

  def destroy
    @workout.destroy
    head :no_content
  end

  private

  def workout_params
    params.permit(:title, :time_spent)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_workout
    @workout = Workout.find(params[:id])
  end
end

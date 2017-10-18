class WorkoutsController < ApplicationController
  before_action :set_user, only: [:create, :index]
  # GET /workouts
  def index
    @workouts = @user.workouts
    json_response(format_all_workouts(@workouts))
  end

  def show
    @workout = Workout.find(params[:id])
    json_response(format_single_workout(@workout))
  end

  def create
    @workout = Workout.create!(workout_params)
    json_response(@workout, :created)
  end

  private

  def workout_params
    params.permit(:title).merge(user: @user)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end

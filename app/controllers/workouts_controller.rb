class WorkoutsController < ApplicationController

  # GET /workouts
  def index
    user = User.find(params[:user_id])
    @workouts = user.workouts
    json_response(@workouts)
  end

  def show
    user = User.find(params[:user_id])
    @workout = Workout.find(params[:id])
    json_response(@workout)
  end
end

class BatchesController < ApplicationController
  before_action :set_exercise, only: [:create]
  before_action :set_batch, only: [:destroy]

  def create
    @set = @exercise.sets.create!
    json_response(@set, :created)
  end

  def destroy
    @set.destroy
    head :no_content
  end

  private

  def set_exercise
    @exercise = Exercise.find(params[:exercise_id])
  end

  def set_batch
    @set = Batch.find(params[:id])
  end
end

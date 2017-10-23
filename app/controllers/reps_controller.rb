class RepsController < ApplicationController
  before_action :set_batch, only: [:create]
  before_action :set_rep, only: [:update, :destroy]

  def create
    @rep = @batch.reps.create!(rep_params)
    json_response(@rep, :created)
  end

  def update
    @rep.update(rep_params)
    head :no_content
  end

  def destroy
    @rep.destroy
    head :no_content
  end

  private

  def rep_params
    params.permit(:weight)
  end

  def set_batch
    @batch = Batch.find(params[:batch_id])
  end

  def set_rep
    @rep = Rep.find(params[:id])
  end
end

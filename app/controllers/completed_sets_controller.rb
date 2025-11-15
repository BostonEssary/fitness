class CompletedSetsController < ApplicationController
  def show
    @completed_set = CompletedSet.find(params[:id])
  end

  def edit
    @completed_set = CompletedSet.find(params[:id])
  end

  def update
    @completed_set = CompletedSet.find(params[:id])
    if @completed_set.update(completed_set_params)
      redirect_to @completed_set
    end
  end

  def create
    @completed_set = CompletedSet.new(completed_set_params)
    if @completed_set.save
      respond_to do |format|
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def completed_set_params
    params.require(:completed_set).permit(:reps, :weight, :order, :entry_id, :workout_id)
  end
end

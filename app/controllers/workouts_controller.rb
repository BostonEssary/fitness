class WorkoutsController < ApplicationController
  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      redirect_to @workout, notice: "Workout was successfully created."
    else
      @plan_enrollment = @workout.plan_enrollment
      render 'plan_enrollments/show', status: :unprocessable_entity
    end
  end

  def show
    @workout = Workout.find(params[:id])
  end

  private

  def workout_params
    params.require(:workout).permit(:plan_enrollment_id, :day)
  end
end

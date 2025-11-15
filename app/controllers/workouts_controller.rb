class WorkoutsController < ApplicationController

  def index
    @active_workouts = Current.user.active_workouts
    @past_workouts = Current.user.past_workouts
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      redirect_to @workout, notice: "Workout was successfully created."
    else
      @plan_enrollment = @workout.plan_enrollment
      flash.now[:alert] = @workout.errors.full_messages.join(", ")
      render 'plan_enrollments/show', status: :unprocessable_entity
    end
  end

  def show
    @workout = Workout.find(params[:id])
    @entries = @workout.plan_enrollment.plan.entries.where(day: @workout.day)
    build_completed_sets_for_form
    @completed_sets_by_entry = @workout.completed_sets_by_entry
  end

  def update
    @workout = Workout.find(params[:id])
    if @workout.update(workout_params)
      redirect_to @workout, notice: "Workout was successfully updated."
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def build_completed_sets_for_form
    @workout.completed_sets.build
  end

  def workout_params
    params.require(:workout).permit(:plan_enrollment_id, :day, :completed_at, :status)
  end
end

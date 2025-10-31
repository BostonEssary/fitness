class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def create
    @plan = Plan.new(plan_params)
    @exercises = Exercise.all
    if @plan.save
      redirect_to @plan, notice: "Plan was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @plan = Plan.new
    @plan.entries.build
    @exercises = Exercise.all
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def plan_params
    params.require(:plan).permit(
      :name,
      entries_attributes: [
        :exercise_id,
        :sets,
        :reps,
        :order,
        :id,
        :_destroy
      ]
    )
  end
end

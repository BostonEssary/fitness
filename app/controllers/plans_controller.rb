class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def create
    @plan = Plan.new(plan_params)
    
    if @plan.save
      redirect_to @plan, notice: "Plan was successfully created."
    else
      @exercises = Exercise.all
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @plan = Plan.new
    @plan.name = params[:name] if params[:name].present?
    @plan.days = params[:days] if params[:days].present?
    @plan.entries.build
    @exercises = Exercise.all
  end

  def show
    @plan = Plan.includes(entries: :exercise).find(params[:id])
  end

  private

  def plan_params
    params.require(:plan).permit(
      :name,
      :days,
      entries_attributes: [
        :exercise_id,
        :sets,
        :reps,
        :order,
        :id,
        :day,
        :_destroy
      ]
    )
  end
end

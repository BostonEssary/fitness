class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to @plan, notice: "Plan was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @plan = Plan.new
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
    params.require(:plan).permit(:name)
  end
end

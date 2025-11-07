class PlanEnrollmentsController < ApplicationController
  before_action :set_plan_enrollment, only: [:show]

  def show
  end

  def create
    @plan_enrollment = PlanEnrollment.new(plan_enrollment_params)
    if @plan_enrollment.save
      redirect_to @plan_enrollment, notice: "Plan enrollment was successfully created."
    else
      @plan = @plan_enrollment.plan
      render 'plans/show', status: :unprocessable_entity
    end
  end
  private

  def plan_enrollment_params
    params.require(:plan_enrollment).permit(:plan_id, :user_id)
  end

  def set_plan_enrollment
    @plan_enrollment = PlanEnrollment.find(params[:id])
  end
end


class PlanEnrollmentsController < ApplicationController
  before_action :set_plan_enrollment, only: [:show]

  def show
  end

  private

  def set_plan_enrollment
    @plan_enrollment = PlanEnrollment.find(params[:id])
  end
end


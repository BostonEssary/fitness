class DashboardsController < ApplicationController
  def show
    @user = Current.user
    @active_plan_enrollment = @user.active_plan_enrollment
    @past_plans = @user.past_plans
  end
end


class DashboardController < ApplicationController
  def show
    @user = Current.user
    @active_plan = @user.active_plan
    @past_plans = @user.past_plans
  end
end


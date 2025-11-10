class DashboardController < ApplicationController
  def show
    @user = Current.user
    @active_plans = @user.active_plans
    @past_plans = @user.past_plans
  end
end


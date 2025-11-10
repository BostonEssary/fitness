require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "downcases and strips email_address" do
    user = User.new(email_address: " DOWNCASED@EXAMPLE.COM ")
    assert_equal("downcased@example.com", user.email_address)
  end

  test "active_workouts" do
    user = users(:one)
    assert_equal(user.active_workouts.count, 1)
  end

  test "past_workouts" do
    user = users(:one)
    assert_equal(user.past_workouts.count, 1)
  end
end

require "test_helper"

class WorkoutControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get workout_create_url
    assert_response :success
  end

  test "should get show" do
    get workout_show_url
    assert_response :success
  end
end

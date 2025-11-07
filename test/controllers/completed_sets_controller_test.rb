require "test_helper"

class CompletedSetsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get completed_sets_create_url
    assert_response :success
  end
end

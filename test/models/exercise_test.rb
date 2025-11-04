require "test_helper"

class ExerciseTest < ActiveSupport::TestCase
  test "should be valid with valid attributes" do
    exercise = exercises(:one)
    assert exercise.valid?
  end

  test "should not be valid without a name" do
    exercise = exercises(:one)
    exercise.name = nil
    assert_not exercise.valid?
  end
end

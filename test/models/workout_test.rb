require "test_helper"

class WorkoutTest < ActiveSupport::TestCase
  test "completed_sets_by_entry" do
    workout = workouts(:one)
    assert_equal(workout.completed_sets_by_entry, { entries(:one).id => [completed_sets(:one)] })
  end

  test "completed_set_count_for_entry" do
    workout = workouts(:one)
    assert_equal(workout.completed_set_count_for_entry(entries(:one)), 1)
  end

  test "set_count_for_entry" do
    workout = workouts(:one)
    assert_equal(workout.set_count_for_entry(entries(:one)), 2)
  end
end

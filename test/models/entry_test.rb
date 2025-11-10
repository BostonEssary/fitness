require "test_helper"

class EntryTest < ActiveSupport::TestCase
  test "should be valid with valid attributes" do
    entry = entries(:one)
    assert entry.valid?
  end

  test "should not be valid without a day" do
    entry = entries(:one)
    entry.day = nil
    assert_not entry.valid?
  end

  test "should not be valid without an order" do
    entry = entries(:one)
    entry.order = nil
    assert_not entry.valid?
  end

  test "should be completed" do
    entry = entries(:completed)
    assert entry.completed?
  end

  test "should not be completed" do
    entry = entries(:not_completed)
    assert_not entry.completed?
  end

  test "should have a humanized sets and reps" do
    entry = entries(:one)
    assert_equal "1 sets × 1 reps", entry.humanized_sets_and_reps
  end
end

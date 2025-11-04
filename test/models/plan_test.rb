require "test_helper"

class PlanTest < ActiveSupport::TestCase
  test "should be valid with valid attributes" do
    plan = plans(:one)
    assert plan.valid?
  end

  test "should not be valid without a name" do
    plan = plans(:one)
    plan.name = nil
    assert_not plan.valid?
  end

  test "should not be valid without a days" do
    plan = plans(:one)
    plan.days = nil
    assert_not plan.valid?
  end

  test "should not be valid with a days greater than 7" do
    plan = plans(:one)
    plan.days = 8
    assert_not plan.valid?
  end

  test "should not be valid with a days less than 1" do
    plan = plans(:one)
    plan.days = 0
    assert_not plan.valid?
  end

  test "should have entries by day" do
    plan = plans(:one)
    assert_equal plan.entries_by_day, { 1 => [entries(:completed), entries(:entry_one)] }
  end
end

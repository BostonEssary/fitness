class Workout < ApplicationRecord
  belongs_to :plan_enrollment
  has_many :completed_sets, dependent: :destroy
  accepts_nested_attributes_for :completed_sets, reject_if: lambda { |attrs| attrs[:reps].blank? || attrs[:weight].blank? }

  enum :status, { started: 0, completed: 1, skipped: 2 }

  validate :only_one_started_workout_per_plan_enrollment

  def completed_sets_by_entry
    completed_sets.group_by(&:entry_id).transform_values do |sets|
      sets.sort_by(&:order)
    end
  end

  def completed_set_count_for_entry(entry)
    return 0 if completed_sets_by_entry[entry.id].blank?

    completed_sets_by_entry[entry.id].count
  end

  def set_count_for_entry(entry)
    return entry.sets if completed_sets_by_entry[entry.id].blank?

    [completed_sets_by_entry[entry.id].count, entry.sets].max
  end

  def name
    plan_enrollment.plan.name
  end

  def less_completed_sets_than_entry_sets?(entry)
    completed_sets_by_entry[entry.id].count < entry.sets
  end

  def only_one_started_workout_per_plan_enrollment
    if plan_enrollment.workouts.started.count > 1
      errors.add(:base, "Only one started workout per plan enrollment is allowed")
    end
  end
end

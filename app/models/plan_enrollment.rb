class PlanEnrollment < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  has_many :workouts, dependent: :destroy

  validate :only_one_active_plan_enrollment_per_user

  enum :status, { active: 0, inactive: 1 }

  def only_one_active_plan_enrollment_per_user
    if other_active_plan_enrollment_for_user?
      errors.add(:base, "Only one active plan enrollment per user is allowed")
    end
  end

  def other_active_plan_enrollment_for_user?
    PlanEnrollment.active.where(user_id: user_id).where.not(id: id).exists?
  end

end
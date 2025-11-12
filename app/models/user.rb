class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :plan_enrollments, dependent: :destroy
  has_many :plans, through: :plan_enrollments

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  
  validates :email_address, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  
  def active_plan_enrollment
    plan_enrollments.active.first
  end

  def workouts
    Workout.where(plan_enrollment_id: plan_enrollments.pluck(:id))
  end

  def active_workouts
    Workout.where(plan_enrollment_id: plan_enrollments.active.pluck(:id))
  end

  def past_workouts
    Workout.where(plan_enrollment_id: plan_enrollments.inactive.pluck(:id))
  end
  
  def past_plans
    past_plan_ids = plan_enrollments.inactive.pluck(:plan_id)
    Plan.where(id: past_plan_ids)
  end
end

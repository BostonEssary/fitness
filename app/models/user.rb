class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :plan_enrollments, dependent: :destroy
  has_many :plans, through: :plan_enrollments

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  
  validates :email_address, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  
  def active_plan
    plan_enrollments.active.first&.plan
  end
  
  def past_plans
    past_plan_ids = plan_enrollments.inactive.pluck(:plan_id)
    Plan.where(id: past_plan_ids)
  end
end

class PlanEnrollment < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  has_many :workouts, dependent: :destroy

  enum :status, { active: 0, inactive: 1 }
end
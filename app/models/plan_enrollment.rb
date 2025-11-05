class PlanEnrollment < ApplicationRecord
  belongs_to :user
  belongs_to :plan

  enum :status, { active: 0, inactive: 1 }
end
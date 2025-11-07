class Workout < ApplicationRecord
  belongs_to :plan_enrollment

  enum :status, { pending: 0, completed: 1, skipped: 2 }
end

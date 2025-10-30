class Plan < ApplicationRecord
  has_many :plan_exercises
  has_many :exercises, through: :plan_exercises
end

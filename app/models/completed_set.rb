class CompletedSet < ApplicationRecord
  belongs_to :workout
  belongs_to :entry

  validates :reps, presence: true, numericality: { greater_than: 0 }
  validates :weight, presence: true, numericality: { greater_than: 0 }
end

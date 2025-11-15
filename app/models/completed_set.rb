class CompletedSet < ApplicationRecord
  belongs_to :workout, touch: true
  belongs_to :entry

  before_create :set_order

  validates :reps, presence: true, numericality: { greater_than: 0 }
  validates :weight, presence: true, numericality: { greater_than: 0 }

  private

  def set_order
    self.order = workout.completed_sets_by_entry[entry.id].to_a.count + 1
  end
end

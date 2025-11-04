class Entry < ApplicationRecord
  belongs_to :plan
  belongs_to :exercise

  validates :day, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 7 }
  validates :order, presence: true, numericality: { greater_than: 0 }

  def humanized_sets_and_reps
    if sets.present? && reps.present?
      "#{sets} sets × #{reps} reps"
    elsif sets.present?
      "#{sets} sets"
    elsif reps.present?
      "#{reps} reps"
    else
      "N/A"
    end
  end

  def completed?
    completed_at.present?
  end
end

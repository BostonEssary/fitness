class Plan < ApplicationRecord
  has_many :entries, dependent: :destroy
  has_many :exercises, through: :entries, dependent: :destroy
  accepts_nested_attributes_for :entries, allow_destroy: true

  validates :name, presence: true
  validates :days, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 7 }

  def entries_by_day
    entries.group_by(&:day).transform_values do |day_entries|
      day_entries.sort_by { |e| e.order || Float::INFINITY }
    end
  end
end

class Exercise < ApplicationRecord
  has_many :entries, dependent: :destroy
  has_many :plans, through: :entries, dependent: :destroy

  validates :name, presence: true

  def humanized_name
    name.titleize
  end
end

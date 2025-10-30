class Exercise < ApplicationRecord
  has_many :entries, dependent: :destroy
  has_many :plans, through: :entries, dependent: :destroy
end

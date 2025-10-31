class Plan < ApplicationRecord
  has_many :entries, dependent: :destroy
  has_many :exercises, through: :entries, dependent: :destroy
  accepts_nested_attributes_for :entries, allow_destroy: true
end

class Plan < ApplicationRecord
  has_many :entries, dependent: :destroy
  has_many :exercises, through: :entries, dependent: :destroy
end

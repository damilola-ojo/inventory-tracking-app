class Inventory < ApplicationRecord
  has_many :locations, dependent: :destroy
  has_many :items, dependent: :destroy
  validates :name, presence: true
end

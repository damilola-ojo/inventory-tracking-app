class Inventory < ApplicationRecord
  has_many :locations, dependent: :destroy
  has_one :base_location, -> { where(base: true) }, 
    class: "Location"
  has_many :items, dependent: :destroy
  validates :name, presence: true
end

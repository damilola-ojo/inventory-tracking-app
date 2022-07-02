class Inventory < ApplicationRecord
  has_many :locations, dependent: :destroy
  has_one :base_location, -> { where(base: true) }, 
    class_name: "Location"

  has_many :items, dependent: :destroy
  validates :name, presence: true

  accepts_nested_attributes_for :base_location

  def change_base_location_to(new_base_location)
    Inventory.trasaction do 
      base_location.update(base: false)
      new_base_location.update(base: true)
    end

    base_location
  end
end

class Item < ApplicationRecord
  belongs_to :inventory
  validates :name, :quantity, presence: true
end

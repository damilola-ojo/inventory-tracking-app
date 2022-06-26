class Location < ApplicationRecord
  belongs_to :inventory
  
  validates :name, :address, :city, :country, presence: true
end

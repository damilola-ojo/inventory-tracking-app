base_location = Location.new(
  name: "Warehouse 1",
  address: Faker::Address.street_address,
  city: Faker::Address.city,
  country: Faker::Address.country,
  base: true
)

inventory = Inventory.create(name: "Sample Inventory", base_location: base_location)

2.upto(9) do |i|
  location = Location.new
  
  location.name    = "Warehouse #{i}"
  location.address = Faker::Address.street_address
  location.city    = Faker::Address.city 
  location.country          = Faker::Address.country
  location.base             = false

  inventory.locations << location
end

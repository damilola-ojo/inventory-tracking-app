require "test_helper"

class LocationControllerTest < ActionDispatch::IntegrationTest
  def setup
    @inventory = Inventory.first
    @location  = @inventory.locations.first
  end

  test "should get index" do
    get inventory_locations_path(@inventory, @location)
    assert_response :success
  end

  test "should get show" do
    get inventory_location_path(@inventory, @location)
    assert_response :success
  end

  test "should get new" do
    get new_inventory_location_path(@inventory)
    assert_response :success
  end

  test "should get edit" do
    get edit_inventory_location_path(@inventory, @location)
    assert_response :success
  end
end

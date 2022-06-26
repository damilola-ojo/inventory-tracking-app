require "test_helper"

class InventoryControllerTest < ActionDispatch::IntegrationTest
    def setup
      @inventory = Inventory.first
    end

    test "should get root" do
     get inventories_path
     assert_response :success
   end

    test "should get new" do
      get new_inventory_path
      assert_response :success
    end

   test "should get edit" do
     get edit_inventory_path(@inventory)
     assert_response :success
   end
end

class InventoriesController < ApplicationController
  
  def index
    @inventory = Inventory.all
  end

  def new
    @inventory = Inventory.new
  end

  def edit
    @inventory = Inventory.find(params[:id])
  end

  def create
    @inventory = Inventory.create(inventory_params)

    if @inventory.save
      redirect_to inventories_path
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @inventory = Inventory.find(params[:id])

    unless params[:inventory][:base_location_id] == @inventory.base_location_id 
      new_base_location = @inventory.locations.find(params[:inventory][:base_location_id])

      @inventory.change_base_location_to(new_base_location)
    end

    if @inventory.update(inventory_params)
      redirect_to inventories_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    
    @inventor.destroy

    redirect_to inventories_path, status: :see_other
  end

  private
    def inventory_params
      params.required(:inventory).permit(:id, :name)
    end
end

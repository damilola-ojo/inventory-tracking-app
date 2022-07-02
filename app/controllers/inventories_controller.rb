class InventoriesController < ApplicationController
  
  def index
    @inventories = Inventory.all
  end

  def new
    @inventory = Inventory.new

    @inventory.build_base_location
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
      params.required(:inventory).permit(:id, :name, base_location_attributes: [:id, :name, :address, :city, :country])
    end
end

class LocationsController < ApplicationController
  
  def index
    @inventory = Inventory.find(params[:inventory_id])
    @locations = @inventory.locations.all
  end

  def show
    @inventory = Inventory.find(params[:inventory_id])
    @location = @inventory.locations.find(params[:id])
  end

  def new
    @inventory = Inventory.find(params[:inventory_id])
    @location = @inventory.locations.build
  end
  
  def edit
    @inventory = Inventory.find(params[:inventory_id])
    @location = Location.find(params[:id])
  end

  def create
    @inventory = Inventory.find(params[:id])
    @location = @inventory.locations.build(location_params)

    if @location.save
      redirect_to inventory_locations_path
    else
      render :new, status: :unporcessable_entity
    end
  end
  
  def update
    @location = Location.find(params[:id])

    if @location.update(location_params)
      redirect_to inventory_locations_path
    else 
      render :edit, status: :unporcessable_entity
    end
  end

  private
    def location_params 
      params.required(:location).permit(:id,
                                       :name,
                                       :address,
                                       :city,
                                       :country)
    end
end

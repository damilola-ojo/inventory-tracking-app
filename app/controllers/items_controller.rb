class ItemsController < ApplicationController
  
  def show
    @item = Item.find(params[:id])
    @inventory = Inventory.find(params[:inventory_id])
  end

  def new
    @inventory = Inventory.find(params[:inventory_id])
    @item = @inventory.items.build
  end

  def edit
    @inventory = Inventory.find(params[:inventory_id])
    @item = Item.find(params[:id])
  end

  def create
    @inventory = Inventory.find(params[:inventory_id])
    @item = @inventory.items.build(item_params)

    if @item.save
      redirect_to inventory_items_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @inventory = Inventory.find(params[:inventory_id])
    @item = Item.find(params[:id])
    
    if @item.update(item_params)
      redirect_to inventory_item_path(@inventory, @item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find(params[:id])

    @item.destroy 

    redirect_to inventory_items_path
  end

  private
    def item_params 
      params.required(:item).permit(:id, :name, :quantity)
    end
end

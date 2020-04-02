class ItemsController < ApplicationController

  def create
      # @item = Item.new(item_params) 
      # @item.user_id = current_user.id
     @item = current_user.items.build(item_params)
     @item.owner=current_user
    if @item.save!
      render json: @item, status: :ok
    else
      render nothing: true, status: :unprocessable_entity
    end
  end

  def user_items
    @item=current_user.items
      render json: @item, status: :ok
  end
 
  def index
    @items = Item.all
   end

  def show
    if params[:user_id].present?
      @item = Item.where(user_id: params[:user_id])
    else
      @item=Item.all
      
    end
    # render json: @item
  end
  def update
      @item = Item.find(params[:id])
      if @item.update(item_params)
        @status=true
        # render json: "ok".to_json, status: :ok
      else
        @status=false
        # render nothing: true, status: 500
      end
    end

   def delete
    byebug
    @item = Item.find(params[:id])
      if @item.destroy 
        @status=true
        # render json: "ok".to_json, status: :ok
      else
        @status=false
         # render nothing: true, status: 500
      end   
    end

  def item_params
    params.require(:item).permit(:name, :item_type, :description, :points, :picture)
  end
end

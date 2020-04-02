class ItemImagesController < ApplicationController
		def create
			item = Item.find(params[:item_id])
	    	@item_image = item.item_images.new(item_image_params)
	      if @item_image.save!
	      	render json: @item_image, status: :ok
	        # format.json { status: :created, location: @item_image }
	      else
	      	render nothing: true, status: :unprocessable_entity
	        # format.json { render json: @item_image.errors, status: :unprocessable_entity }
	      end
	  	end

  def show
  	byebug
  	@item = Item.find(params[:item_id])
  	@picture = @item.item_images
    # render json: {url: picture}
  end


  	 def item_image_params
    	 params.require(:item_image).permit(:image)
      # params.fetch(:user_image, {})
    end
end

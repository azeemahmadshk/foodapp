class RequestsController < ApplicationController
  def create
    byebug
    if params[:request][:sender_id] || params[:request][:user_id].present?
      @request = Request.new(request_params)
      if @request.save!
        @status=true
        # render json: @request, status: :ok
      else
        @status=false
        # render nothing: true, status: :unprocessable_entity
      end	
    end
  end
  def request_accepted
    byebug
    @request = Request.find(params[:id])
    if params[:request][:status] == 'accepted'
        if @request.sender_id.present?
        # if params[:request][:sender_id].present?
          swape_item
        else
          if user.points>item.points||user.points == item.points
            user.points-item.points
            sender.points+item.points 
            swape_item
            else
            render json: "rejected".to_json
          end
        end
      @request.update(status: params[:request][:status])
      # current_user.points-item.points
      render json: "ok".to_json, status: :ok
      elsif params[:request][:status] == 'rejected' 
      @request.update(status: params[:request][:status])
      byebug
      render json: "rejected".to_json, status: :ok
      else
      render nothing: true, status: :unprocessable_entity
    end
  end
  
 private
  def accept_params
    params.require(:request).permit(:sender_id, :reciever_id, :user_id )
  end
	def request_params
      params.require(:request).permit(:sender_id, :reciever_id, :status, :user_id)
  end
  def swape_item
    sender_user_id = @request.sender_id
    byebug
    @request.sender.update(owner_id: @request.reciever_id, status: false)
    @request.reciever.update(owner_id: sender_user_id, status: false)
    @item.update(status:false)

  end
end


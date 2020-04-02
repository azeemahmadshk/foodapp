class UsersController < ApplicationController
	
	skip_before_action :authenticate_request, :only => [:create]

	def home
	end
	def index
		@user= User.all
		@status=true
	end
   def profile
    @user=current_user
    render json: @user, status: :ok
  end

  def create 
  	# byebug
    @user = User.new(user_params)
    if @user.save
    	@status = true
    render json: @user, status: :created
    else
    	@status = false
      render json: {errors: @user.errors, status: false} 
    end
  end

  def update  
    if current_user.update(user_params)
    	@status=true
    	@user=current_user
       # render json: current_user, status: :ok
      # Handle a successful update.
    else
    	@status=false
    	@error= current_user.errors
      # render json: current_user.errors, status: :unprocessable_entity
    end
  end 

  def show
      @user = User.find(params[:id])
      # render json: @user
  end

   def user_params
      params.require(:user).permit(:email, :username, :password, :address, :gender, :phone, :password_confirmation, :points)
    end
end

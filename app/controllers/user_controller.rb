class UserController < ApplicationController

	before_action :confirm_logged_in, :except => [:index, :show, :create, :new]

	def index
		@users = User.alphasort
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to(:action => 'index')
		else
			render('new')
		end
	end

	
	def new
    	@user = User.new
    
  	end

private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end

end

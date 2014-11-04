class UserController < ApplicationController

	before_action :confirm_logged_in, :except => [:index, :show, :create, :new]

	def index
		@users = User.alphasort
	end

	def show
		@user = user.find(params[:id])
	end

	def create
		@user = User.new
		if @user.save
			redirect_to( :action => 'index')
		else
			render('new')
		end
	end

	
	def new
    	@user = User.new
    
  	end

  	

end

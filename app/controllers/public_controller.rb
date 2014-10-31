class PublicController < ApplicationController
	def index
	end

	def signup
		if params[:password]  == params[:confirm_password]
			@user = User.new()
			@user.email = params[:email]
			@user.password = params[:password]
			@user.first_name = params[:first_name]
			@user.last_name = params[:last_name]
			if @user.save
				redirect_to(:action => 'index')
			end
		else
			#SOomething about flash notice
			redirect_to(:action => 'index')
		end


	end

	def attempt_login
		if params[:email].present? && params[:password].present?
			found_user = User.where(:email => params[:email]).first
			if found_user
				authorized_user = found_user.authenticate(params[:password])
			end
		end
		if authorized_user
	      # mark user as logged in
	      flash[:notice] = "You are now logged in."
	      redirect_to(:action => 'index')
 		else
	  		flash[:notice] = "Invalid username/password combination."
	  		redirect_to(:action => 'login')
  		end
	end

	def logout
		flash[:notice] = "Logged out"
    	redirect_to(:action => 'index')
	end
end

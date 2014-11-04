class UserController < ApplicationController

	before_action :confirm_logged_in, :except => [:index, :show, :create]

	def index
		@users = User.alphasort
	end

	def show
	end

	def create
		@user = User.new
		redirect_to(:controller => 'public', :action => 'index')
	end

end

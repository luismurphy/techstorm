class ProjectController < ApplicationController

	before_action :confirm_logged_in, :except => [:index, :show]

  def create
  end

  def index
  	@users = User.sorted
  end

  def show
  	@user = User.find(params[:id])
  end
end

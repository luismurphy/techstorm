class ProjectController < ApplicationController

	before_action :confirm_logged_in, :except => [:index, :show]

  def create
  end

  def index
  	@projects = Project.alphasort
  end

  def show
  	@project = Project.find(params[:id])
  end
end

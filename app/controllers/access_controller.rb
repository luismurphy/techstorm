class AccessController < ApplicationController
  def index
  	#display text and links
  end

  def login
  	#login form
  end
  
  def attempt_login
    if params[:user][:email].present? && params[:user][:password].present?
      found_user = User.where(:email => params[:user][:email]).first
      if found_user
        authorized_user = found_user.authenticate(params[:user][:password])
      end
    end
    if authorized_user
      # mark user as logged in
      
      flash[:notice] = "You are now logged in."
      redirect_to(:controller => 'user', :action => 'show')
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:controller => 'public', :action => 'index')
    end
  end

  def logout

  end
end

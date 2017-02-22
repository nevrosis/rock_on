class AccessController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def menu
    # display menu
  end

  def login
    # login form
  end

  def attempt_login

    if params[:email].present? && params[:password].present?
      found_user = PowerUser.where(:email => params[:email]).first
      if found_user
        #auth_user = found_user.authenticate(params[:password])
        auth_user = true
      end
    end

    if found_user
      session[:user_id] = found_user.id
      session[:user_first_name] = found_user.first_name
      flash[:notice] = "You are now logged in"
      redirect_to(admin_path)
    else
      flash.now[:notice] = "Invalid credential"
      render('login')
    end

  end

  def logout
    session[:user_id] = nil
    flash.now[:notice] = "Logged Out"
    redirect_to(bands_path)
  end



end

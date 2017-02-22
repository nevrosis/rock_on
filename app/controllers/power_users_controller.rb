class PowerUsersController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in

  def index
    @power_users = PowerUser.sorted
  end

  def show
  end

  def new
    @power_user = PowerUser.new()
  end

  def create
    @power_user = PowerUser.new(power_user_params)
    if @power_user.save
      flash[:notice] = "Admin User Added"
      redirect_to(power_users_path)
    else
      render('new')
    end
  end

  def edit
    @power_user = PowerUser.find(params[:id])
  end

  def update
    @power_user = PowerUser.find(params[:id])
    if @power_user.update_attributes(power_user_params)
      flash[:notice] = "Admin User updated"
      redirect_to(power_users_path)
    else
      render('edit')
    end
  end

  def delete
  end

  def name
    "#{first_name} #{last_name}"
  end

  private

  def power_user_params
    params.require(:power_user).permit(:first_name, :last_name, :email, :password_digest)
  end

end

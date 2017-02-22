class BandsController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in, :except => [:index, :show]

  def index
    if session[:user_id]
      @bands = Band.sorted
    else
      @bands = Band.sorted.active
    end
  end

  def show
    @band = Band.find(params[:id])
  end

  def new
    @band = Band.new()
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      flash[:notice] = "Band Added"
      redirect_to(bands_path)
    else
      render('new')
    end
  end

  def edit
    @band = Band.find(params[:id])
  end

  def update
    @band = Band.find(params[:id])
    if @band.update_attributes(band_params)
      flash[:notice] = "Band updated"
      redirect_to(bands_path)
    else
      render('edit')
    end
  end

  def delete
  end

  def destroy
  end

  private

  def band_params
    params.require(:band).permit(:active, :name, :website)
  end

end

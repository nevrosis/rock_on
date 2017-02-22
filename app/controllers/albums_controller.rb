class AlbumsController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in, :except => [:index, :show]

  def index
    if session[:user_id]
      @albums = Album.sorted
    else
      @albums = Album.sorted.active
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new()
    @bands = Band.sorted
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      flash[:notice] = "Album Added"
      redirect_to(albums_path)
    else
      render('new')
    end
  end

  def edit
    @album = Album.find(params[:id])
    @bands = Band.sorted
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(album_params)
      flash[:notice] = "Album updated"
      redirect_to(albums_path)
    else
      render('edit')
    end
  end

  def delete
    @album = Album.find(params[:id])
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    flash[:notice] = "Album '#{@album.title}' deleted"
    redirect_to(albums_path)
  end

  private

  def album_params
    params.require(:album).permit(:active, :title, :year, :band_id)
  end

end

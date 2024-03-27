class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!, except: :root
  before_action :set_genre, only: [:edit, :update]

  def index
    @genres = Genre.page(params[:page])
    @genre = Genre.new
  end

  def edit
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "successfully created."
      redirect_to admin_genres_path
    else
      @genres = Genre.page(params[:page])
      flash[:alert] = "error"
      render :index
    end
  end

  def update
    if @genre.update(genre_params)
      flash[:notice] = "successfully updated."
      redirect_to admin_genres_path
    else
      render :edit
    end
  end

  private
  def set_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end

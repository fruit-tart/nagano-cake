class Admin::GenresController < ApplicationController
  before_action :set_genre, only: [:edit, :update]
  
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end
  
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "successfully created."
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      flash[:alert] = "error"
      render :index
    end
  end
  
  def update
    if @genre.update(genre_params)
      redirect_to admin_genres_path, notice: "ジャンルを更新しました"
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

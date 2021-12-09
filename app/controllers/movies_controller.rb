class MoviesController < ApplicationController
  def index
    if params[:query].present?
      @movies = Movie.global_search(params[:query])
    else
      @movies = Movie.all
    end
    @movie = Movie.new
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :index
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Le film '#{@movie.title}' a été supprimé!"
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :alternative_titles, :year, :score, :rating, :actors, :genre)
  end

end

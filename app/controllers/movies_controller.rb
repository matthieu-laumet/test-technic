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
    @objectID = Movie.last.objectID + 1
    @movie = Movie.new(title: params[:movie][:title], objectID: @objectID, actors: params[:movie][:actors], alternative_titles: params[:movie][:alternative_titles], year: params[:movie][:year], score: params[:movie][:score], rating: params[:movie][:rating], genre: params[:movie][:genre])
    # raise
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
    params.require(:movie).permit(:title, :alternative_titles, :year, :score, :rating, :actors, :genre, :objectID)
  end

end

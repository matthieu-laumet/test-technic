class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end
end


.sort_by { |word| word.year }

class MoviesController < ApplicationController
  def index
    keyword = params[:keyword]
    movie = msf
    @movies = movie.get_movies(keyword)
  end

  def show
    @movie = msf.return_movie(params[:id])
  end

  private

  def msf
    MovieSearchFacade.new
  end
end

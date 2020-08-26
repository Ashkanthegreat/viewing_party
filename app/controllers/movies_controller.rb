require_relative '../services/movie_db_service.rb'
require_relative '../poros/movie.rb'
require_relative '../facades/movie_search_facade.rb'

class MoviesController < ApplicationController
  def index
    keyword = params[:keyword]
    movie = MovieSearchFacade.new
    @movies = movie.get_movies(keyword)
  end

  def show
    @movie = MovieSearchFacade.new.return_movie(params[:id])
  end
end

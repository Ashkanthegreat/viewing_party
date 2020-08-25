require_relative '../services/movie_db_service.rb'
require_relative '../poros/movie.rb'
require_relative '../facades/movie_search_facade.rb'

class MoviesController < ApplicationController
  def index
    movie = MovieSearchFacade.new
    @movies = movie.index
  end
end

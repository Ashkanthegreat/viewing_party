require_relative '../services/moviedb_service.rb'
require_relative '../poros/movie.rb'
require_relative '../facades/movie_search_facade.rb'


class MoviesController < ApplicationController
  def top_10
    movie = MovieSearchFacade.new
    @movies = movie.top_10
  end
end

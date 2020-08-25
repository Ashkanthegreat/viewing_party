require_relative '../services/movie_db_service.rb'
require_relative '../poros/movie.rb'
require_relative '../facades/movie_search_facade.rb'


class MoviesController < ApplicationController
  def top_40
    movie = MovieSearchFacade.new
    @movies = movie.top_40
  end
end

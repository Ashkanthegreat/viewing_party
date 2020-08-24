class MovieSearchFacade
  def initialize
    @movie_service = MovieDBService.new
  end

  def top_10
    @movie_service.top_rated_movies
  end
end

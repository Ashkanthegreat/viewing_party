class MovieSearchFacade
  def initialize
    @movie_service = MovieDBService.new
  end

  def index
    movies_results = @movie_service.top_rated_movies
    @movies = []
    while @movies.size < 40
      movies_results[:results].each do |movie_info|
        @movies << Movie.new(movie_info)
      end
    end
    @movies
  end
end

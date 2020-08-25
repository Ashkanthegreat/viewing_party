class MovieSearchFacade
  def initialize
    @movie_service = MovieDBService.new
  end

  def get_movies(keyword)
    if keyword.nil?
      top_40
    else
      keyword_search(keyword)
    end
  end

  def top_40
    movies_results = @movie_service.top_rated_movies
    @movies = []
    while @movies.size < 40
      movies_results[:results].each do |movie_info|
        @movies << Movie.new(movie_info)
      end
    end
    @movies
  end

  def keyword_search(keyword)
    movies_results = @movie_service.search_movie(keyword)
    @movies = []
    while @movies.size < 40
      movies_results[:results].each do |movie_info|
        @movies << Movie.new(movie_info)
      end
    end
    @movies
  end
end

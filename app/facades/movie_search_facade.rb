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
    @movies = movies_results.map do |movie_info|
      Movie.new(movie_info)
    end
  end

  def keyword_search(keyword)
    movies_results = @movie_service.search_movie(keyword)
    @movies = movies_results.map do |movie_info|
      Movie.new(movie_info)
    end
  end

  def return_movie(id)
    movie_info = @movie_service.movie_details(id)
    Movie.new(movie_info)
  end
end

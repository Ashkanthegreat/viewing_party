class MovieDBService
  def top_rated_movies
    results = conn.get('movie/top_rated')
    JSON.parse(results.body, symbolize_names: true)
  end

  def search_movie(keyword)
    results = conn.get("search/movie?query=#{keyword}")
    JSON.parse(results.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: 'https://api.themoviedb.org/3') do |f|
      f.params['api_key'] = ENV['MOVIES_API_KEY']
    end
  end
end

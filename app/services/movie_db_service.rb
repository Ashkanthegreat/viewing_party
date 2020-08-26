class MovieDBService
  def top_rated_movies
    page1 = conn.get('movie/top_rated?page=1')
    page2 = conn.get('movie/top_rated?page=2')
    results1 = JSON.parse(page1.body, symbolize_names: true)
    results1 = results1[:results]
    results2 = JSON.parse(page2.body, symbolize_names: true)
    results2 = results2[:results]
    results1.concat(results2)
  end

  def search_movie(keyword)
    page1 = conn.get("search/movie?query=#{keyword}&page=1")
    page2 = conn.get("search/movie?query=#{keyword}&page=2")
    results1 = JSON.parse(page1.body, symbolize_names: true)
    results1 = results1[:results]
    results2 = JSON.parse(page2.body, symbolize_names: true)
    results2 = results2[:results]
    results1.concat(results2)
  end

  def movie_details(movie_id)
    movie = conn.get("movie/#{movie_id}")
    JSON.parse(movie.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: 'https://api.themoviedb.org/3') do |f|
      f.params['api_key'] = ENV['MOVIES_API_KEY']
    end
  end
end

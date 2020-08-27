class MovieDBService < BaseService
  def top_rated_movies
    page1 = conn.get('movie/top_rated?page=1')
    page2 = conn.get('movie/top_rated?page=2')
    results1 = json(page1)
    results1 = results1[:results]
    results2 = json(page2)
    results2 = results2[:results]
    results1.concat(results2)
  end

  def search_movie(keyword)
    page1 = conn.get("search/movie?query=#{keyword}&page=1")
    page2 = conn.get("search/movie?query=#{keyword}&page=2")
    results1 = json(page1)
    results1 = results1[:results]
    results2 = json(page2)
    results2 = results2[:results]
    results1.concat(results2)
  end

  def movie_details(movie_id)
    movie = conn.get("movie/#{movie_id}")
    json(movie)
  end

  def movie_credits(movie_id)
    movie = conn.get("movie/#{movie_id}/credits")
    json(movie)
  end

  def movie_reviews(movie_id)
    movie = conn.get("movie/#{movie_id}/reviews")
    json(movie)
  end

  private

  def conn
    Faraday.new(url: 'https://api.themoviedb.org/3') do |f|
      f.params['api_key'] = ENV['MOVIES_API_KEY']
    end
  end
end

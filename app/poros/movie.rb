class Movie
  attr_reader :id, :title, :vote_average

  def self.top_10
    @service = MovieDBService.new
  end

  def initialize(movie_info)
    @id = movie_info[:id]
    @title = movie_info[:title]
    @vote_average = movie_info[:vote_average]
  end
end

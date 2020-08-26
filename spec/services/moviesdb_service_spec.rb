require 'rails_helper'
require 'spec_helper'

RSpec.describe "Movie DB Service", :vcr do
  it "returns the top rated movies" do
    movies = MovieDBService.new.top_rated_movies
    expect(movies[0][:original_title].class).to eq(String)
    expect(movies[0][:popularity].class).to eq(Float)
    expect(movies[0][:vote_count].class).to eq(Integer)
    expect(movies[0][:vote_average].class).to eq(Float)
    expect(movies.count).to eq(40)
    expect(movies[0][:original_title]).to_not eq(movies[20][:original_title])
  end
  it 'Returns searched keyword for movies' do
    keyword = 'Terminator'
    movies = MovieDBService.new.search_movie(keyword)
    expect(movies[0][:original_title].class).to eq(String)
    expect(movies[0][:popularity].class).to eq(Float)
    expect(movies[0][:vote_count].class).to eq(Integer)
    expect(movies[0][:vote_average].class).to eq(Float)
    expect(movies.count).to eq(40)
    expect(movies[0][:original_title]).to_not eq(movies[20][:original_title])
  end
  it "Returns the details about one movie" do
    id = 12
    movie = MovieDBService.new.movie_details(id)
    expect(movie[:original_title]).to eq("Finding Nemo")
  end
end

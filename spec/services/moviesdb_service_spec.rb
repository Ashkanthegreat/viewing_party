require 'rails_helper'
require 'spec_helper'

RSpec.describe "Movie DB Service", :vcr do
  it "returns the top rated movies" do
    movies = MovieDBService.new.top_rated_movies
    expect(movies[:results][0][:original_title].class).to eq(String)
    expect(movies[:results][0][:popularity].class).to eq(Float)
    expect(movies[:results][0][:vote_count].class).to eq(Integer)
    expect(movies[:results][0][:vote_average].class).to eq(Float)
  end
end

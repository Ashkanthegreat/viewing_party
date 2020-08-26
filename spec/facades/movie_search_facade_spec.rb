require 'rails_helper'
require 'spec_helper'

RSpec.describe MovieSearchFacade do
  before(:each) do
    @movie_facade = MovieSearchFacade.new
  end
  it "exists" do
    expect(@movie_facade.class).to eq(MovieSearchFacade)
  end
  describe "instance_methods" do
    it "top_40" do
      result = @movie_facade.top_40
      info = result.first
      expect(result.size).to eq(40)
      expect(info.class).to eq(Movie)
      expect(info.title.class).to eq(String)
      expect(info.id.class).to eq(Integer)
      expect(info.vote_average.class).to eq(Float)
    end
    it 'get_movies' do
     results = @movie_facade.get_movies('Terminator')
     info = results.first
     expect(results.size).to be <= 40
     expect(info.class).to eq(Movie)
     expect(info.title.class).to eq(String)
     expect(info.id.class).to eq(Integer)
     expect(info.vote_average.class).to eq(Float)
     results = @movie_facade.top_40
     info = results.first
     expect(results.size).to be <= 40
     expect(info.class).to eq(Movie)
     expect(info.title.class).to eq(String)
     expect(info.id.class).to eq(Integer)
     expect(info.vote_average.class).to eq(Float)
    end
   it 'keyword_search' do
     results = @movie_facade.keyword_search('Terminator')
     info = results.first
     expect(results.size).to be <= 40
     expect(info.class).to eq(Movie)
     expect(info.title.class).to eq(String)
     expect(info.id.class).to eq(Integer)
     expect(info.vote_average.class).to eq(Float)
   end
   it "return_movie" do
     title = "Finding Nemo"
     results = @movie_facade.return_movie(12)
     expect(results.title).to eq(title)
   end
  end
end

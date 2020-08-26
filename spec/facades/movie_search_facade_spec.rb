require 'rails_helper'
require 'spec_helper'

RSpec.describe MovieSearchFacade do
  it "exists" do
    movie_facade = MovieSearchFacade.new
    expect(movie_facade.class).to eq(MovieSearchFacade)
  end
  describe "instance_methods" do
    it "top_40" do
      results = MovieSearchFacade.new.top_40
      expect(results.size).to eq(40)
      expect(results.first.class).to eq(Movie)
      expect(results.first.title.class).to eq(String)
      expect(results.first.id.class).to eq(Integer)
      expect(results.first.vote_average.class).to eq(Float)
    end
    it 'get_movies' do
     results = MovieSearchFacade.new.get_movies('Terminator')
     expect(results.size).to be <= 40
     expect(results.first.class).to eq(Movie)
     expect(results.first.title.class).to eq(String)
     expect(results.first.id.class).to eq(Integer)
     expect(results.first.vote_average.class).to eq(Float)
     results = MovieSearchFacade.new.top_40
     expect(results.size).to be <= 40
     expect(results.first.class).to eq(Movie)
     expect(results.first.title.class).to eq(String)
     expect(results.first.id.class).to eq(Integer)
     expect(results.first.vote_average.class).to eq(Float)
    end
   it 'keyword_search' do
     results = MovieSearchFacade.new.keyword_search('Terminator')
     expect(results.size).to be <= 40
     expect(results.first.class).to eq(Movie)
     expect(results.first.title.class).to eq(String)
     expect(results.first.id.class).to eq(Integer)
     expect(results.first.vote_average.class).to eq(Float)
   end
  end
end

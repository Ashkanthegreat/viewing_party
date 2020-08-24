require 'rails_helper'
require 'spec_helper'

RSpec.describe Movie do
  it "exists" do
    info = {
      id: 10,
      title: "A Movie",
      vote_average: 8.9
    }

    movie = Movie.new(info)

    expect(movie.class).to eq(Movie)
    expect(movie.title).to eq("A Movie")
    expect(movie.vote_average).to eq(8.9)
  end
end

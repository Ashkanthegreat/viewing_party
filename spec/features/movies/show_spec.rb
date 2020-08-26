require 'rails_helper'
require 'spec_helper'

RSpec.describe "Movies index page" do
  before :each do
    mock_user
    visit '/'
    click_link "Sign in with Google"
    click_button "Discover Top 40 Rated Movies"
  end
  VCR.use_cassette('returns_the_top_rated_movies') do
    it "routes to the movie show page properly" do
      results = MovieSearchFacade.new.top_40

      click_link results[0].title
      expect(current_path).to eq(movies_show_path)
    end
  end
end

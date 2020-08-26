require 'rails_helper'
require 'spec_helper'

RSpec.describe "Movies index page" do
  before :each do
    @user = mock_user
    visit '/'
    click_link "Sign in with Google"
  end
  VCR.use_cassette('returns_the_top_rated_movies') do
    it "allows the user to find the top 40 rated movies" do
      click_button "Discover Top 40 Rated Movies"
      expect(current_path).to eq(index_path)
      expect(page).to have_content("Top 40 Rated Movies:")
      results = MovieSearchFacade.new.top_40
      expect(page).to have_link(results[0].title)
      expect(page).to have_content(results[0].vote_average)
    end
    it 'displays search form' do
      click_button "Discover Top 40 Rated Movies"
      expect(page).to have_button('Discover Movies with keyword')
    end
  end
  describe 'movie search results' do
    it 'allows us to discover movies by keyword', :vcr do
      keyword = 'Terminator'
      within ".Movies" do
        fill_in 'keyword', with: keyword
        click_on 'Discover Movies with keyword'
      end
      expect(current_path).to eq(index_path)
      expect(page).to have_content('Terminator')
    end
    it 'displays discovery button' do
      within ".Movies" do
        fill_in 'keyword', with: 'Terminator'
        click_on 'Discover Movies with keyword'
      end
      expect(page).to have_button("Discover Top 40 Rated Movies")
    end
  end
end

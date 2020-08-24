require 'rails_helper'
require 'spec_helper'

RSpec.describe "gets the top 40 rated movies from MoviesDB", :vcr do
  it "allows the user to find the top 40 rated movies" do
    mock_user
    visit '/'
    click_link "Sign in with Google"
    click_button "Discover Top 40 Rated Movies"
    expect(page).to have_content("Gabriel")
    save_and_open_page
  end
end

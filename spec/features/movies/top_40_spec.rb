require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Movies Top 40 Index Page' do
  describe 'As a logged in user' do
    before :each do
      @user = mock_user
      visit '/'
      click_link "Sign in with Google"
    end
    it 'routes correctly and displays header text' do
      click_button "Discover Top 40 Rated Movies"
      expect(current_path).to eq(top_40_path)
      expect(page).to have_content("Top 40 Rated Movies:")
    end
  end
end

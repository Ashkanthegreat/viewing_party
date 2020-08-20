require 'rails_helper'
require 'spec_helper'
require 'omniauth'

RSpec.describe 'User Dashboard Page' do
  describe 'As a logged in user' do
    it 'can display my name upon logging in' do
      user = mock_user
       visit '/'
       click_on "Sign in with Google"
       expect(current_path).to eq("/dashboard")
       expect(page).to have_content("Welcome, #{user["info"]["name"]}!")
    end
    it 'can see a button to discover movies' do
      mock_user
      visit '/'

      click_on "Sign in with Google"
      expect(current_path).to eq("/dashboard")
      expect(page).to have_button('Discover Movies')
    end
    it "can see a friends section" do
      mock_user
      visit '/'

      click_on "Sign in with Google"
      expect(current_path).to eq("/dashboard")

      expect(page).to have_css(".Friends")
    end
    it "can see a viewing parties section" do
      mock_user
      visit '/'

      click_on "Sign in with Google"
      expect(current_path).to eq("/dashboard")

      expect(page).to have_css(".Viewing_Parties")
    end

  end
end

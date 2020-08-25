require 'rails_helper'
require 'spec_helper'
require 'omniauth'

RSpec.describe 'User Dashboard Page' do
  describe 'As a logged in user' do
    before :each do
      @user = mock_user
      visit '/'
      click_link "Sign in with Google"

    end
    it 'can display my name upon logging in' do
      expect(current_path).to eq("/dashboard")
      expect(page).to have_content("Welcome, #{@user["info"]["name"]}!")
      expect(page).to have_button("Discover Top 40 Rated Movies")
      expect(page).to have_css(".Friends")
      expect(page).to have_css(".Viewing_Parties")
      within ".Friends" do
        expect(page).to have_content "Add a Friend"
        expect(page).to have_button "Add Friend"
        expect(page).to have_content "You currently have no friends"
      end
    end
    it "redirects me to the discover page when clicking on the discover button" do
      click_on "Discover Top 40 Rated Movies"
      expect(current_path).to eq(index_path)
    end
    it "can add friends who are users" do
      user_1 = User.create!(email: "name@name_1.com", name: "User_1")
      within ".Friends" do
        fill_in "email", with: user_1.email
        click_on "Add Friend"
      end
      expect(current_path).to eq("/dashboard")
      within '.flash-messages' do
        expect(page).to have_content("Friend added!")
      end
      within ".Friends" do
        expect(page).to have_content "Here are your friends:"
        expect(page).to have_content user_1.name
      end
    end
    it "displays a flash message when trying to add a friend who is not a user" do
      within ".Friends" do
        fill_in "email", with: "friend@friend.com"
        click_on "Add Friend"
      end
      within '.flash-messages' do
        expect(page).to have_content "Email not found"
      end
    end
  end
end

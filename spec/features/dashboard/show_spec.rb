require 'rails_helper'
require 'spec_helper'
require 'omniauth'

RSpec.describe 'User Dashboard Page' do
  describe 'As a logged in user' do
    it 'can display my name upon logging in' do
      OmniAuth.config.test_mode = true
       user = OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
           :provider => "google",
           :uid => "12345",
           :info => {
             :name => "Sample Name",
             :email => "name@name.com"
           },
           :credentials => {
             :google_token => "google_token",
             :google_refresh_token => "google_refresh_token"
           }
         }
       )

       visit '/'
       click_on "Sign in with Google"
       expect(current_path).to eq("/dashboard")
       expect(page).to have_content("Welcome, #{user["info"]["name"]}!")
    end
  end
end

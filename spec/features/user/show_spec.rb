require 'rails_helper'
require 'omniauth'


RSpec.describe 'User Dashboard' do
  describe 'After Authenticating, as a user' do
    it 'can see a welcome message for the user' do
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

       click_link('Sign in with Google')
       expect(current_path).to eq("/user/#{user.id}/dashboard")
       expect(page).to have_content("Welcome #{user.name}!")
    end
  end
end

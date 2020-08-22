require 'rails_helper'
require 'spec_helper'
require 'omniauth'

RSpec.describe 'Welcome Page' do
  describe 'when i visit the welcome page' do
    it 'can see a description of the app' do
      visit '/'

      expect(page).to have_content('Welcome to Viewing Party')
      expect(page).to have_content('Viewing Party is an application that allows you to watch movies with friends remotely!')
    end

    it "displays a button to log in a user with google" do
       visit '/'

      expect(page).to have_link("Sign in with Google")
    end
  end
end

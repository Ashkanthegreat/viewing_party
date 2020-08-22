require 'rails_helper'
require 'spec_helper'

RSpec.describe User do
  describe 'Relationships' do
    it {should have_many(:friends).through(:friendships)}
    it {should have_many :friendships}
  end

  describe 'Class Methods' do
    it ".from_omniauth" do
      expect(User.count).to eq(0)
      user_data = mock_user
      User.from_omniauth(user_data)
      expect(User.count).to eq(1)
    end
  end
end

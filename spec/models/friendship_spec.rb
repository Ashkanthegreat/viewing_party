require 'rails_helper'
require 'spec_helper'

RSpec.describe Friendship do
  describe 'Relationships' do
    it {should belong_to :user}
    it {should belong_to :friend}
  end

  describe 'Class Methods' do
    before :each do
      user_data = mock_user
      @user_1 = User.create(name: user_data[:info][:name], email: user_data[:info][:email])
    end
    it ".create_reciprocal_for_ids" do
      expect(@user_1.friends.count).to eq(0)
      friend = User.create(name: "Friend", email: "friend@friend.com")
      Friendship.create_reciprocal_for_ids(@user_1.id, friend.id)
      expect(@user_1.friends.count).to eq(1)
    end
    it ".create_reciprocal_for_ids" do
      friend = User.create(name: "Friend", email: "friend@friend.com")
      Friendship.create_reciprocal_for_ids(@user_1.id, friend.id)
      expect(@user_1.friends.count).to eq(1)
      Friendship.destroy_reciprocal_for_ids(@user_1.id, friend.id)
      expect(@user_1.friends.count).to eq(0)
    end
  end
end

class FriendshipsController < ApplicationController
  before_action :user_logged_in

  def create
    friend = User.find_by_email(params[:friend_email])
    if friend.present?
      @new_friendships = Friendship.create_reciprocal_for_ids(current_user.id, friend.id)
      flash[:success] = 'Friend added!'
    else
      flash[:error] = 'Email not found'
    end
    redirect_to dashboard_path
  end
end

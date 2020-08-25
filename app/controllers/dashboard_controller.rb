class DashboardController < ApplicationController
  before_action :user_logged_in
  def show
    @user = User.find(current_user.id)
  end
end

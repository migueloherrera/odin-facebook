class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if user_signed_in?
      @user = current_user
      @friends = User.friends(current_user)
      @pendings = @user.invited_friendships.where(accepted: false)
      @notifications = @user.received_friendships.where(accepted: false)
      @not_friends = User.not_friends(current_user)
    else
      redirect_to new_user_session_path
    end
  end
  def show
    if params[:id].nil?
      @user = current_user
    else
      @user = User.find(params[:id])
    end
  end
  
end

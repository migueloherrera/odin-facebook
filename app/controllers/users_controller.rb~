class UsersController < ApplicationController
  
  def index
    @possible_friends = User.all.where.not(id: current_user.id)
    # create a method to return only the users who are not friends yet
  end
  
  def show
    if user_signed_in?
      @user = current_user
      #and posts
    else
      redirect_to new_user_session_path
    end
  end
end

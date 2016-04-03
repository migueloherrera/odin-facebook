class UsersController < ApplicationController
  def show
    if user_signed_in?
      #@reviews = current_user.reviews
    else
      redirect_to new_user_session_path
    end
  end
end

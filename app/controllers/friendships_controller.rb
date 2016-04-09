class FriendshipsController < ApplicationController

  def create
    from_id = current_user.id
  	to_id = params[:id]
  	@friendship = current_user.invited_friendships.build(from_id: from_id, to_id: to_id)
    if @friendship.save
      redirect_to root_path
    end
  end
  
  def update
    from_id = params[:id]
    to_id = current_user.id
    @friendship = Friendship.where(from_id: from_id, to_id: to_id).first
    @friendship = Friendship.where(from_id: to_id, to_id: from_id).first if !@friendship
    @friendship.update_attributes(accepted: true)
    redirect_to root_path
  end
  def destroy
    to_id = current_user.id
  	from_id = params[:id]
  	@friendship = Friendship.where(from_id: from_id, to_id: to_id).first
  	@friendship = Friendship.where(from_id: to_id, to_id: from_id).first if !@friendship
  	@friendship.destroy
  	redirect_to root_path
  end
  
end

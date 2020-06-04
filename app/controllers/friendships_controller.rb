class FriendshipsController < ApplicationController
  def create
    @friend = current_user.friendships.build(friend_id: params[:friend_id], confirmed: false)
    if @friend.save
      redirect_to users_path, notice: 'friend request sent sucessfully!'
    else
      redirect_to users_path, alert: 'Request failed!'
    end
  end

  def update
    @friend = Friendship.find_by(friend_id: params[:user_id], user_id: params[:id])
    @friend.update(confirmed: true)
    if @friend.save
      redirect_to users_path, notice: 'You are now friends!'
    else
      redirect_to users_path, alert: 'Request failed!'
    end
  end

  def destroy
    @friend = Friendship.find_by(user_id: current_user.id, friend_id: params[:id])
    @friend ||= Friendship.find_by(user_id: params[:id], friend_id: current_user.id)
    @friend.destroy
    if @friend.confirmed
      redirect_to users_path, notice: 'Successfully unfriended!'
    else
      redirect_to users_path, notice: 'Successfully cancelled request!'
    end
  end
end

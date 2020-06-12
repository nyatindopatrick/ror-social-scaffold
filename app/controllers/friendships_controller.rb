class FriendshipsController < ApplicationController
  def create
    @friend = current_user.friendships.build(friend_id: params[:id], confirmed: false)
    if @friend.save
      redirect_to users_path, notice: 'friend request sent sucessfully!'
    else
      redirect_to users_path, alert: 'Request failed!'
    end
  end

  def update
    @friend = User.find(params[:id])
    current_user.confirm_friend(@friend)
    redirect_to users_path, notice: 'You are now friends!'
  end

  def destroy
    @friend = Friendship.find_by(user_id: current_user.id, friend_id: params[:id])
    @friend ||= Friendship.find_by(user_id: params[:id], friend_id: current_user.id)
    @friend.destroy
    if @friend.destroy && @friend.confirmed
      redirect_to users_path, notice: 'Successfully unfriended!'
    elsif @friend.destroy && !@friend.confirmed
      redirect_to users_path, notice: 'Successfully cancelled request!'
    end
  end
end

module FriendshipsHelper
  def friend_btn(user)
    if user.id == current_user.id
      nil
    elsif current_user.pending_friends.map(&:id).include?(user.id)
      link_to 'Cancel Request', user_friendship_path(current_user, user), method: :delete, class: 'add-friend'
    elsif current_user.friend?(user)
      link_to 'Unfriend', user_friendship_path(current_user, user), method: :delete, class: 'add-friend'

    elsif current_user.friend_requests.map(&:id).include?(user.id)
      link_to 'Confirm request', user_friendship_path(current_user, user), method: :patch, class: 'add-friend'
    else
      link_to 'Add Friend', user_friendships_path(current_user, friend_id: user.id),
              method: :post, class: 'fas fa-user-plus add-friend'
    end
  end

  def reject_btn(user)
    link = link_to 'Reject', user_friendship_path(current_user, user), method: :delete, class: 'add-friend'
    return link if current_user.friend_requests.map(&:id).include?(user.id)
  end
end

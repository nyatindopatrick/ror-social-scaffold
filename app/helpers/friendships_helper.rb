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

  def mutual_friends(user)
    return nil if user == current_user

    m = current_user.friends.select { |u| user.friends.include?(u) }
    m = m.delete(current_user) if m.include?(current_user)
    if m.empty?
      '0 mutual friends'
    elsif m.size == 1
      "#{m[0].name} is a mutual friend"
    elsif m.size == 2
      "#{m[0].name} and #{m[1].name} are mutual friends"
    else
      "#{m[0].name} and #{m.size - 1} others are mutual friends"

    end
  end
end

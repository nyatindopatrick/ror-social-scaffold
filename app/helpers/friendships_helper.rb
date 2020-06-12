module FriendshipsHelper
  def friend_btn(user)
    if user.id == current_user.id
      nil
    elsif current_user.pending_friends.map(&:id).include?(user.id)
      link_to 'Cancel Request', delete_request_user_path(user), method: :delete, class: 'add-friend'
    elsif current_user.friends.include?(user) || user.friends.include?(current_user)
      link_to 'Unfriend', delete_request_user_path(user), method: :delete, class: 'add-friend'

    elsif current_user.friend_requests.map(&:id).include?(user.id)
      link_to 'Confirm request', confirm_request_user_path(user), method: :put, class: 'add-friend'
    else
      link_to 'Add Friend', send_request_user_path(user),
              method: :post, class: 'fas fa-user-plus add-friend'
    end
  end

  def reject_btn(user)
    link = link_to 'Reject', delete_request_user_path(user), method: :delete, class: 'add-friend'
    return link if current_user.friend_requests.map(&:id).include?(user.id)
  end

  # rubocop:disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
  def mutual_friends(user)
    return nil if user == current_user

    m = current_user.friends.select { |u| user.friends.include?(u) }
    m = m.delete(current_user) if m.include?(current_user)

    if !m.is_a?(Array) && m == current_user || m.empty?
      '0 mutual friends'
    elsif m.size == 1
      "#{m[0].name} is a mutual friend"
    elsif m.size == 2
      "#{m[0].name} and #{m[1].name} are mutual friends"
    else
      "#{m[0].name} and #{m.size - 1} others are mutual friends"
    end
  end
  # rubocop:enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
end

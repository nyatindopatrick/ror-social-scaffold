require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
    it { should have_many(:friendships) }
    it { should have_many(:inverse_friendships).class_name(:Friendship) }
    it { should have_many(:confirmed_friendships).class_name(:Friendship) }
    it { should have_many(:friends) }
    it { should have_many(:pending_friendships).class_name(:Friendship) }
    it { should have_many(:pending_friends) }
    it { should have_many(:inverted_friendships).class_name(:Friendship) }
    it { should have_many(:friend_requests) }
  end
end

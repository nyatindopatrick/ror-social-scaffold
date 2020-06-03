require 'rails_helper'

RSpec.describe FriendshipsHelper, type: :helper do
  let(:user) { User.new(name: 'pato', email: 'pato@gmail.com', password: 'password') }
  let(:friend) { User.new(name: 'pato1', email: 'pato1@gmail.com', password: 'password') }
  let(:params) { { user_id: 1, friend_id: 2, confirmed: false } }
  let(:current_user) { user }
  before(:each) do
    user.save
    friend.save
  end
  context 'Friend button method' do
    it "should return nil if I'm the user" do
      expect(friend_btn(user)).to eq nil
    end

    it 'should not return nil' do
      current_user.friendships.build(friend_id: 2, confirmed: true).save
      expect(friend_btn(friend)).not_to eql(nil)
    end
  end
end

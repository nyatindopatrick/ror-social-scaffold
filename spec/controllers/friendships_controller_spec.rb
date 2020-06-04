require 'rails_helper'

RSpec.describe FriendshipsController do
  let(:user) { User.new(name: 'pato', email: 'pato@gmail.com', password: 'password') }
  let(:friend) { User.new(name: 'pato1', email: 'pato1@gmail.com', password: 'password') }
  let(:params) { { user_id: 1, friend_id: 2, confirmed: false } }

  before(:each) do
    user.save
    friend.save
    controller.stub(:current_user).and_return(user)
  end

  context 'POST #create' do
    it 'responds to html' do
      post :create, params: params
      expect(response.content_type).to eq 'text/html'
    end
  end
end

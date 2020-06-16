require 'rails_helper'
require_relative '../support/friendships.rb'
require_relative '../support/signup_form'

feature 'Send and Accept Request' do
  let(:user) { User.new(name: 'pato', email: 'pato@gmail.com', password: 'password') }
  let(:friend) { User.new(name: 'pato1', email: 'pato1@gmail.com', password: 'password') }
  let(:signup) { Signup.new }
  let(:friendship) { Friendships.new }

  before(:each) do
    user.save
    friend.save
    signup.visit_page('/users/sign_up').register
  end

  scenario 'Should reload users page when friend request sent' do
    friendship.visit_page('/users').do_action('Add Friend')
    expect(page.current_path).to eq '/users'
  end

  scenario 'Should reload users page when friend request cancelled' do
    friendship.visit_page('/users').do_action('Add Friend')
    friendship.visit_page('/users').do_action('Cancel Request')
    expect(page.current_path).to eq '/users'
  end
end

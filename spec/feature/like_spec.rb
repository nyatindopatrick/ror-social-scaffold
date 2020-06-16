require 'rails_helper'
require_relative '../support/likes'
require_relative '../support/signup_form'
require_relative '../support/post'

feature 'Like and Unlike' do
  let(:user) { Signup.new }
  let(:like) { Likes.new }
  let(:post) { PostPage.new }
  before(:each) do
    user.visit_page('/users/sign_up').register
    post.visit_page('/').create_post
  end

  scenario 'Like link changes to Unlike when liked' do
    like.visit_page('/').like
    expect(page).to have_content 'Dislike'
  end
end

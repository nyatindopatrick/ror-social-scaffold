require 'rails_helper'
require_relative '../support/post'
require_relative '../support/signup_form'

feature 'Create Post' do
  let(:user) { Signup.new }
  let(:post) { PostPage.new }
  before(:each) do
    user.visit_page('/users/sign_up').register
  end

  scenario 'Create New post' do
    post.visit_page('/').create_post
    expect(page).to have_content 'brown fox'
  end
end

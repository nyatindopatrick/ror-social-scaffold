require 'rails_helper'
require_relative '../support/comment'
require_relative '../support/signup_form'
require_relative '../support/post'

feature 'Comment On Post' do
  let(:user) { Signup.new }
  let(:post) { PostPage.new }
  let(:comment) { Comments.new }
  before(:each) do
    user.visit_page('/users/sign_up').register
    post.visit_page('/').create_post
  end

  scenario 'Comment on a post' do
    comment.visit_page('/').create_comment
  end
end

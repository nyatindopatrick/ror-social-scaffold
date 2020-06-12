require 'rails_helper'
require_relative '../support/signup_form'

feature 'Signup Page' do
  let(:signup) { Signup.new }
  scenario 'Register User' do
    signup.visit_page('/users/sign_up').register
    expect(page.current_path).to eq '/'
  end
end

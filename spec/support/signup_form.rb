class Signup
  include Capybara::DSL

  def visit_page(path)
    visit(path)
    self
  end

  def register
    fill_in('user[name]', with: 'Patrick')
    fill_in('user[email]', with: 'nyatindopatrick@gmail.com')
    fill_in('user[password]', with: 'mypassword')
    fill_in('user[password_confirmation]', with: 'mypassword')

    click_on('Sign up')
    self
  end
end

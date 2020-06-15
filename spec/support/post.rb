class PostPage
  include Capybara::DSL

  def visit_page(path)
    visit(path)
    self
  end

  def create_post
    fill_in('post[content]', with: 'The quick brown fox jumped over the lazy dog')
    click_on('Save')
  end
end

class Comments
  include Capybara::DSL

  def visit_page(path)
    visit(path)
    self
  end

  def create_comment
    fill_in('comment[content]', with: 'Nice Post')
    click_on('Comment')
    self
  end
end

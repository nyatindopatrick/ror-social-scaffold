class Likes
  include Capybara::DSL

  def visit_page(path)
    visit(path)
    self
  end

  def like
    first(:link, 'Like').click
    self
  end
end

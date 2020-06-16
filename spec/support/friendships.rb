class Friendships
  include Capybara::DSL
  def visit_page(path)
    visit(path)
    self
  end

  def do_action(action)
    first(:link, action).click
    self
  end
end

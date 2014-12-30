module ApplicationHelper
  def page_title(name)
    content_for(:title) { name }
  end
end

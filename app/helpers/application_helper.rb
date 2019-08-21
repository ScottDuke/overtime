module ApplicationHelper
  def active?(path)
    "active" if current_page?(path)
  end

  def sr_only_span(path)
    "<span class='sr-only'>(current)</span>" if current_page?(path)
  end
end

module ApplicationHelper
  def active?(path)
    "active" if current_page?(path)
  end

  def sr_only_span(path)
    "<span class='sr-only'>(current)</span>" if current_page?(path)
  end

  def bootstrap_class_for(flash_type)
    case flash_type.to_s
      when "success"
      "success"
    when "error"
      "danger"
    when "alert"
      "warning"
    when "notice"
      "info"
    else
      flash_type.to_s
    end
  end
end

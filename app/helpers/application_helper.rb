# frozen_string_literal: true

module ApplicationHelper
  def active?(path)
    "active" if current_page?(path)
  end

  def sr_only_span(path)
    "<span class='sr-only'>(current)</span>" if current_page?(path)
  end

  def background_colour_for(flash_type)
    case flash_type.to_s
    when "success"
      "linear-gradient(to right, rgba(157,213,58,1) 0%,rgba(161,213,79,1) 50%,rgba(124,188,10,1) 100%)"
    when "error"
      "linear-gradient(to right, rgba(247,100,74,1) 0%,rgba(231,56,39,1) 100%)"
    when "alert"
      "linear-gradient(to right, rgba(252,236,88,1) 0%,rgba(241,218,54,1) 100%)"
    when "notice"
      "linear-gradient(to right, rgba(41,137,216,1) 0%,rgba(30,87,153,1) 100%)"
    else
      "linear-gradient(to right, rgba(135,224,253,1) 0%,rgba(83,203,241,1) 40%,rgba(5,171,224,1) 100%)"
    end
  end

  def state_badge(state)
    badge_class = case state
    when "submitted", "pending"
      "primary"
    when "approved", "confirmed"
      "success"
    when "rejected"
      "danger"
    end

    content_tag(:span, state.titleize, class: "badge badge-#{badge_class}")
  end
end

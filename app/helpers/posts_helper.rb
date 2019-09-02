# frozen_string_literal: true

module PostsHelper
  def state_badge(state)
    badge_class = case state
    when "submitted"
      "primary"
    when "approved"
      "success"
    when "rejected"
      "danger"
    end

    content_tag(:span, state.titleize, class: "badge badge-#{badge_class}")
  end
end

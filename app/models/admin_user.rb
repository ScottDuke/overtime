# frozen_string_literal: true

class AdminUser < User
  def admin?
    true
  end

  def employee?
    false
  end
end

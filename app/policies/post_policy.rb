# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  def update?
    return true if record.approved? && user.admin?
    user_or_admin && !record.approved?
  end

  private

  def user_or_admin
    user.admin? || record.user_id == user.id
  end
end

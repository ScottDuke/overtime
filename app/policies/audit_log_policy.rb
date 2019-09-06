# frozen_string_literal: true

class AuditLogPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def confirm?
    record.user_id == user.id
  end
end

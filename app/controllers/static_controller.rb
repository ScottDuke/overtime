# frozen_string_literal: true

class StaticController < ApplicationController
  def homepage
    if current_user.admin?
      set_admin_homepage_values
    else
      set_user_homepage_values
    end
  end

  private

  def set_admin_homepage_values
    @pending_approvals = Post.submitted
    @recent_audit_items = AuditLog.last(10)
  end

  def set_user_homepage_values
    @pending_audit_confirmations = current_user.audit_logs.pending.by_desc_start_date
  end
end

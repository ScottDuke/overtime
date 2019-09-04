# frozen_string_literal: true
class AuditLogsController < ApplicationController
  def index
    @audit_logs = AuditLog.all.page(params[:page])
    authorize @audit_logs
  end
end

# frozen_string_literal: true
class AuditLogsController < ApplicationController
  before_action :set_audit_log, only: %w(confirm)

  def index
    @audit_logs = AuditLog.all.page(params[:page])
    authorize @audit_logs

    respond_to do |format|
      format.js
      format.html
    end
  end

  def confirm
    authorize @audit_log

    @audit_log.confirm!

    flash[:success] = "Audit log has been confirmed"
    redirect_to root_path
  end

  private

  def set_audit_log
    @audit_log = current_user.audit_logs.find(params[:id])
  end
end

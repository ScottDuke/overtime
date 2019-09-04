# frozen_string_literal: true
class AuditLogsController < ApplicationController
  def index
    @audit_logs = AuditLog.all.page(params[:page])
    authorize @audit_logs

    respond_to do |format|
      format.js
      format.html
    end
  end
end

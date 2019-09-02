# frozen_string_literal: true

class AuditLog < ApplicationRecord
  include StateMachines::AuditLogsStateMachine

  belongs_to :user
end

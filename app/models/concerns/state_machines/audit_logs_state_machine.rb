# frozen_string_literal: true

module StateMachines::AuditLogsStateMachine
  extend ActiveSupport::Concern

  included do
    include AASM

    aasm column: 'state' do
      state :pending, initial: true
    end
  end
end

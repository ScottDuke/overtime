# frozen_string_literal: true

module StateMachines::AuditLogsStateMachine
  extend ActiveSupport::Concern

  included do
    include AASM

    aasm column: 'state' do
      state :pending, initial: true
      state :confirmed

      event :confirm do
        transitions from: :pending, to: :confirmed
      end

      event :pending do
        transitions from: :confirmed, to: :pending
      end
    end
  end
end

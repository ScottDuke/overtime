# frozen_string_literal: true

module StateMachines::PostsStateMachine
  extend ActiveSupport::Concern

  included do
    include AASM

    aasm column: 'state' do
      state :submitted, initial: true
      state :approved, :rejected

      event :accept do
        transitions from: %i(submitted rejected), to: :approved
      end

      event :reject do
        transitions from: %i(submitted approved), to: :rejected
      end

      event :submit do
        transitions from: %i(approved rejected), to: :submitted
      end
    end
  end
end

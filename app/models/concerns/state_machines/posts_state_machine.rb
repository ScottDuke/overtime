module StateMachines::PostsStateMachine
  extend ActiveSupport::Concern

  included do
    include AASM

    aasm column: 'state' do
      state :submitted, initial: true
      state :approved
      state :rejected
    end

  end
end
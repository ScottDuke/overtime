class Post < ApplicationRecord
  include StateMachines::PostsStateMachine

  belongs_to :user

  validates_presence_of :date, :rationale, message: "can't be blank"

  attr_accessor :state_event
  after_save :trigger_state_change, if: :state_event

  private

  def trigger_state_change
    can_send = send("may_#{state_event}?")
    send("#{state_event}!") if send("may_#{state_event}?")
  end
  
end

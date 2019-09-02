class Post < ApplicationRecord
  include StateMachines::PostsStateMachine

  belongs_to :user

  validates_presence_of :date, :rationale, :overtime_request, message: "can't be blank"
  validates :overtime_request, numericality: { greater_than: 0.0 }
  # validates_numericality_of :overtime_request, greater_than: 0

  attr_accessor :state_event
  after_save :trigger_state_change, if: :state_event

  private

  def trigger_state_change
    send("#{state_event}!") if send("may_#{state_event}?")
  end
end

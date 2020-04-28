# frozen_string_literal: true

class Post < ApplicationRecord
  include StateMachines::PostsStateMachine

  belongs_to :user

  validates_presence_of :date, :rationale, :overtime_request, message: "can't be blank"
  validates :overtime_request, numericality: { greater_than: 0.0 }
  # validates_numericality_of :overtime_request, greater_than: 0

  attr_accessor :state_event
  after_save :trigger_state_change, if: :state_event
  after_save :confirm_audit_log, if: :submitted?
  after_save :unconfirm_audit_log, if: :rejected?

  private

  def trigger_state_change
    send("#{state_event}!") if send("may_#{state_event}?")
  end

  def confirm_audit_log
    audit_log = AuditLog.pending.find_by(user_id: user_id, start_date: (date - 7.days..date))
    audit_log&.confirm!
  end

  def unconfirm_audit_log
    audit_log = AuditLog.confirmed.find_by(user_id: user_id, start_date: (date - 7.days..date))
    audit_log&.pending!
  end
end

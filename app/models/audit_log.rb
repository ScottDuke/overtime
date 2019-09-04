# frozen_string_literal: true
class AuditLog < ApplicationRecord
  include StateMachines::AuditLogsStateMachine

  belongs_to :user

  validates_presence_of :start_date, message: "can't be blank"

  before_validation :set_defaults

  private

  def set_defaults
    self.start_date ||= 6.days.ago
  end
end

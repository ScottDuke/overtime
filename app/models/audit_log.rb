# frozen_string_literal: true
class AuditLog < ApplicationRecord
  include StateMachines::AuditLogsStateMachine

  belongs_to :user

  validates_presence_of :start_date, message: "can't be blank"

  before_validation :set_defaults
  before_update :set_end_date, if: :confirmed?

  scope :by_desc_start_date, -> { order(start_date: :desc) }

  private

  def set_defaults
    self.start_date ||= 6.days.ago
  end

  def set_end_date
    self.end_date = Date.today
  end
end

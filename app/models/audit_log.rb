class AuditLog < ApplicationRecord
  include StateMachines::AuditLogsStateMachine
  
  belongs_to :user
end

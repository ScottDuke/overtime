# frozen_string_literal: true

class CreateAuditLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :audit_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :state
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end

# frozen_string_literal: true

class ManagerMailer < ApplicationMailer
  def email(manager)
    @manager = manager
    mail(to: @manager.email, subject: "Daily Overtime Request")
  end
end

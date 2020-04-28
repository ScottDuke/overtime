# frozen_string_literal: true

namespace :notification do
  desc "Sends sms message to employees asking them to log any overtime"
  task sms: :environment do
    return unless Time.now.sunday?
    employees = Employee.all

    # TODO Update user message and urls.

    APP_URL = Rails.env.production? ? "https://sd-overtime-app.herokuapp.com/" : "localhost:4000"
    message = "Please login to the overtime dashboard to request overtime or confirm your hours last week #{APP_URL}"

    employees.each do |employee|
      SmsService.new({ phone_number: employee.phone_number,
                        message: message }).send_sms
    end
  end

  desc "Sends email notification to admin users each day of pending overtime requests"
  task manager_email: :environment do
    submitted_posts = Post.submitted
    admin_users = AdminUser.all

    if submitted_posts.any?
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_now
      end
    end
  end
end

# frozen_string_literal: true

namespace :notification do
  desc "Sends sms message to employees asking them to log any overtime"
  task sms: :environment do
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

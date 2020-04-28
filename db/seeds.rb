# frozen_string_literal: true

puts "creating a user"

user = Employee.create(email: "test@example.com",
                    password: "password",
                    password_confirmation: "password",
                    first_name: "Testy",
                    last_name: "Tester",
                    phone_number: Rails.application.credentials.twilio[:phone_number])

puts "Created employee"

AdminUser.create(email: "admin@example.com",
                 password: "password",
                 password_confirmation: "password",
                 first_name: "Admin",
                 last_name: "Tester",
                 phone_number: Rails.application.credentials.twilio[:phone_number])

puts "Created admin user"

puts "creating 100 posts"

100.times do |count|
  overtime_request = rand(1.0...12.0).round(1)
  Post.create!(date: Date.today, rationale: "#{count} content", user: user, overtime_request: overtime_request)
end

puts "finished creating 100 posts"

puts "creating audit logs"

AuditLog.create!(user: user, start_date: 6.days.ago)
AuditLog.create!(user: user, start_date: 13.days.ago)
AuditLog.create!(user: user, start_date: 20.days.ago)

puts "finished creating audit logs"

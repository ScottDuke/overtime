puts "creating a user"

user = User.create(email: "test@example.com",
                    password: "password",
                    password_confirmation: "password",
                    first_name: "Testy",
                    last_name: "Tester",
                    phone_number: Rails.application.credentials.twilio[:phone_number])

puts "Created user"

AdminUser.create(email: "admin@example.com",
                 password: "password",
                 password_confirmation: "password",
                 first_name: "Admin",
                 last_name: "Tester",
                 phone_number: Rails.application.credentials.twilio[:phone_number])

puts "Created admin user"

puts "creating 100 posts"

100.times do |post|
  overtime_request = rand(1.0...12.0).round(1)
  Post.create!(date: Date.today, rationale: "#{post} content", user: user, overtime_request: overtime_request)
end

puts "finished creating 100 posts"

puts "creating 100 audit logs"

100.times do |post|
  AuditLog.create!(user: user, start_date: 1.week.ago)
end

puts "finished creating 100 audit logs"
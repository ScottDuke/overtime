puts "creating a user"

@user = User.create(email: "test@example.com", password: "password", password_confirmation: "password", first_name: "Testy", last_name: "Tester")

puts "Created user"

puts "creating 100 posts"

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} content", user: @user)
end

puts "finished creating 100 posts"
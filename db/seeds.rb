puts "creating 100 posts"

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} content")
end

puts "finished creating 100 posts"
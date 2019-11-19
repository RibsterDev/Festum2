

content = File.read("#{Rails.root}/db/events#{@department}.json")
events = JSON.parse(content)
events.each do |event|
  Event.create!(event)
end

# EventUser.destroy_all
# Event.destroy_all
User.destroy_all


# user1 = User.new(
#   name: "lea",
#   email: "lea@gmail.com",
#   password: "lealea"
#   )
# user1.save!
# user2 = User.new(
#   name: "evan",
#   email: "evan@gmail.com",
#   password: "evanevan"
#   )
# user2.save!
# user3 = User.new(
#   name: "jeremy",
#   email: "jeremy@gmail.com",
#   password: "jeremy"
#   )
# user3.save!
# users = [user1, user2, user3]

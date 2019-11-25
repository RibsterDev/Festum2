
departments = [69, 92]
departments.each do |department|
  content = File.read("#{Rails.root}/db/events#{department}.json")
  events = JSON.parse(content)
  events.each do |event|
    Event.create!(event)
  end
end

EventUser.destroy_all
User.destroy_all

user1 = User.new(
  name: "lea",
  email: "lcbelzunces@festeam.io",
  password: "lealea",
  photo: "lea.png"
  )
user1.save!

user2 = User.new(
  name: "evan",
  email: "evanwichlarz1@festeam.io",
  password: "evanevan",
  photo: "evan.png"
  )
user2.save!

user3 = User.new(
  name: "jeremy",
  email: "jeremygibilaro@festeam.io",
  password: "jeremy",
  photo: "jeremy.png"
  )
user3.save!

user4 = User.new(
  name: "nicolas",
  email: "nicolasmorlot@festeam.io",
  password: "nicolas",
  photo: "nicolas.png"
  )
user4.save!

users = [user1, user2, user3, user4]

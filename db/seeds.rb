
departments = [69, 92]
departments.each do |department|
  content = File.read("#{Rails.root}/db/events#{department}.json")
  events = JSON.parse(content)
  events.each do |event|
    Event.create!(event)
  end
end

User.destroy_all

user1 = User.new(
  name: "lea",
  email: "lcbelzunces@festeam.io",
  password: "lealea"
  )
user1.save!

user2 = User.new(
  name: "evan",
  email: "evanwichlarz1@festeam.io",
  password: "evanevan"
  )
user2.save!

user3 = User.new(
  name: "jeremy",
  email: "jeremygibilaro@festeam.io",
  password: "jeremy"
  )
user3.save!

user4 = User.new(
  name: "nicolas",
  email: "nicolasmorlot@festeam.io",
  password: "nicolas"
  )
user4.save!

users = [user1, user2, user3, user4]

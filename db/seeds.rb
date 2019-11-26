
departments = [69, 92]
departments.each do |department|
  content = File.read("#{Rails.root}/db/events#{department}.json")
  events = JSON.parse(content)
  events.each do |event|
    Event.create!(event)
  end
end

EventUser.destroy_all
UserGroup.destroy_all
Group.destroy_all
User.destroy_all

user1 = User.new(
  name: "lea",
  email: "lcbelzunces@gmail.com",
  password: "lealea",
  photo: "lea.png"
  )
user1.save!

user2 = User.new(
  name: "evan",
  email: "evanwichlarz1@hotmail.fr",
  password: "evanevan",
  photo: "evan.png"
  )
user2.save!

user3 = User.new(
  name: "jeremy",
  email: "jeremygibilaro@gmail.com",
  password: "jeremy",
  photo: "jeremy.png"
  )
user3.save!

user4 = User.new(
  name: "nicolas",
  email: "nicolasmorlot@gmail.com",
  password: "nicolas",
  photo: "nicolas.png"
  )
user4.save!

users = [user1, user2, user3, user4]
users1 = [user2, user3]
users2 = [user2, user3, user1]

groupe1 = Group.create(
  name: "Soiree du chill",
  location: "Lyon",
  date_event: "2019-11-27",
  proposition_duration: 6,
  vote_duration: 3
  )

users.each do |user|
  UserGroup.create(
    user: user,
    group: groupe1
    )
end



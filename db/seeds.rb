
# penser a ajouter le departement dans l array departements
departments = [01, 03, 07, 38, 42, 63, 69, 73, 74, 75, 92]
departments.each do |department|
  department < 10 ? content = File.read("#{Rails.root}/db/events0#{department}.json") : content = File.read("#{Rails.root}/db/events#{department}.json")
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


groupe1 = Group.create(
  name: "Soiree du chill",
  location: "Lyon",
  date_event: "25-11-25",
  proposition_duration: 6,
  vote_duration: 3
  )

users.each do |user|
  UserGroup.create(
    user: user,
    group: groupe1
    )
end


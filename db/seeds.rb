# penser a ajouter le departement dans l array departements
Vote.destroy_all
EventUser.destroy_all
UserGroup.destroy_all
Group.destroy_all
User.destroy_all


if ENV['SEED_EVENTS'] == 'true'

  Event.destroy_all
  # # departments = [01, 03, 07, 38, 42, 63, 69, 73, 74, 75, 92]


   departments1 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  departments2 = (10..95).to_a
  departments = departments1 + departments2
  departments.delete(26)
  departments.delete(66)
  # departments.delete(75)
  departments.delete(92)

  # departments = [69]
  # departments = [01, 03, 07, 38, 42, 63, 69, 73, 74, 75, 92]
  departments.each do |department|
    department < 10 ? content = File.read("#{Rails.root}/db/events0#{department}.json") : content = File.read("#{Rails.root}/db/events#{department}.json")
    events = JSON.parse(content)
    events.each do |event|
      Event.create!(event)
    end
  end
#   bar_json = [1, 2, 3, 4]
# bar_json.each do |fichier|
#     content = File.read("#{Rails.root}/db/eventsbars2#{fichier}.json")
#         events = JSON.parse(content)
#     events.each do |event|
#       Event.create!(event)
#     end
#   end
end



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

users1 = [user1, user2, user3, user4]
users2 = [user1, user3]
users3 = [user1, user2, user3]

# groupe1 = Group.create(
#   name: "Soiree du chill",
#   location: "Lyon",
#   date_event: "2019-11-27",
#   proposition_duration: 6,
#   vote_duration: 3
# )


# groupe2 = Group.create(
#   name: "Soiree du group2",
#   location: "Lyon",
#   date_event: "2019-11-27",
#   proposition_duration: 6,
#   vote_duration: 3
# )

# groupe3 = Group.create(
#   name: "Soiree du group3",
#   location: "Lyon",
#   date_event: "2019-11-27",
#   proposition_duration: 6,
#   vote_duration: 3
# )

# UserGroup.create(users1.map {|u| {user: u, group: groupe1}})
# UserGroup.create(users2.map {|u| {user: u, group: groupe2}})
# UserGroup.create(users3.map {|u| {user: u, group: groupe3}})

# ap "group1: #{groupe1.id}"
# ap "group2: #{groupe2.id}"
# ap "group3: #{groupe3.id}"


# #GROUP 1 all users proposed event.

# events_group1 = Event.all.sample(4)
# users1.each_with_index do |u, i|
#   EventUser.create!(event: events_group1[i], user: u, group: groupe1)
# end

# #GROUP 1 all users proposed event and user 3 has voted.

# events_group2 = Event.all.sample(2)
# users2.each_with_index do |u, i|
#   EventUser.create!(event: events_group2[i], user: u, group: groupe2)
# end

# Vote.create!(sort: 0, user: user3, event_user: EventUser.find_by(user: user1, group: groupe2))
# Vote.create!(sort: 1, user: user3, event_user: EventUser.find_by(user: user3, group: groupe2))







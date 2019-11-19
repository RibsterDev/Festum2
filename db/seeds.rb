
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 'https://www.google.com/search?client=ubuntu&channel=fs&q=<evenement+lyon>&ie=utf-8&oe=utf-8'

# 'https://www.routard.com/guide_agenda/lyon.htm'

# 'https://nokogiri.org/tutorials/installing_nokogiri.html'
# # Fetch and parse HTML document
# doc = Nokogiri::HTML(open('https://www.routard.com/guide_agenda/lyon.htm'))

# # puts "### Search for nodes by css"
# # doc.css('h3').each do |link|
# #   puts link.content
# # end

# # puts "### Search for nodes by xpath"
# # doc.xpath('h3').each do |link|
# #   puts link.content
# # end

# puts "### Or mix and match."
# doc.search('h3').each do |link|
#   puts link.content
#   Event.new{
#     name:
#   }
# end
content = File.read("#{Rails.root}/db/events.json")
events = JSON.parse(content)
events.each do |event|
  Event.create!(event)
end

# EventUser.destroy_all
# Event.destroy_all
User.destroy_all


user1 = User.new(
  name: "lea",
  email: "lea@gmail.com",
  password: "lealea"
  )
user1.save!
user2 = User.new(
  name: "evan",
  email: "evan@gmail.com",
  password: "evanevan"
  )
user2.save!
user3 = User.new(
  name: "jeremy",
  email: "jeremy@gmail.com",
  password: "jeremy"
  )
user3.save!
users = [user1, user2, user3]


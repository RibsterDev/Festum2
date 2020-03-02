# require 'open-uri'
# require 'json'
# require 'rest-client'

# class LeCarnetDesBarsScraper

#   def initialize
#     @url = "https://www.lecarnetdesbars.com/jm-ajax/get_listings/"
#   end

#   def scrap
# array = []

# bar_json = [1, 2, 3, 4]
# bar_json.each do |fichier|
#       data_bar = File.read("db/eventsbars#{fichier}.json")
#       data = JSON.parse(data_bar)

#       data["listings"]
#       data["listings"].each do |file|
#         # p file["json_ld"]["mainEntityOfPage"]["@id"]
#         # p "-----------------------------------------------------------------------------------------------"
#         # p filefile["object"]["post_date"]

#         namee = file["title"].blank? ? "" : file["title"]
#         date_start = file["object"]["post_date"].split(" ")[0].blank? ? "" : file["object"]["post_date"].split(" ")[0]
#         date_end = DateTime.now.next_year(10).blank? ? "" : DateTime.now.next_year(10)
#         address = file["location"]["raw"].blank? ? "" : file["location"]["raw"]
#         category = "Bars"
#         sub_category = ""
#         photo_url = file["featuredImage"]["url"].blank? ? "" : file["featuredImage"]["url"]
#         lat = file["location"]["lat"].blank? ? "" : file["location"]["lat"]
#         long = file["location"]["lng"].blank? ? "" : file["location"]["lng"]
#         description = file["object"]["post_content"].blank? ? "" : file["object"]["post_content"]
#         event_url = file["json_ld"]["mainEntityOfPage"].nil? ? "" : file["json_ld"]["mainEntityOfPage"]["@id"].blank? ? "" : file["json_ld"]["mainEntityOfPage"]["@id"]

#         p namee
#         p date_start
#         p date_end
#         p address
#         p category
#         p sub_category
#         p photo_url
#         p lat
#         p long
#         p description
#         p event_url

#    array << {
#         name: namee,
#         date_start: date_start,
#         date_end: date_end,
#         address: address,
#         category: category,
#         sub_category: sub_category,
#         photo_url: photo_url,
#         lat: lat,
#         long: long,
#         description: description,
#         event_url: event_url
#       }
#     end
#     File.open("db/eventsbars2#{fichier}.json", 'wb') do |file|
#       file.write(JSON.generate(array))
#     end
#     end

#     # data.uniq { |e| e[:name] }
#   end

#   end



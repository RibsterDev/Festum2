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
francais_chiffre = {
 "janvier" => "1",
 "février" => "2",
 "mars" => "3",
 "avril" => "4",
 "mai" => "5",
 "juin" => "6",
 "juillet" => "7",
 "août" => "8",
 "septembre" => "9",
 "octobre" => "10",
 "novembre" => "11",
 "décembre" => "12"
}



require 'open-uri'
require 'nokogiri'
departement = '69'
url = "https://#{departement}.agendaculturel.fr"
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
details = []
html_doc.search('.title-list-event').each do |element|
 details << element.attribute('href').value
end
details.each do |path|
 url_complete = "#{url}#{path}"
 html_file = open(url_complete).read
 html_doc = Nokogiri::HTML(html_file)

 # url_address = html_doc.search('.block_link').attribute('href').value
 # html_file_address = open(url_address).read
 # html_doc_address = Nokogiri::HTML(html_file_address)
# else
# end
# html_doc_address

 a = html_doc.search('.date-start .annee').text.empty? ? html_doc.search('.annee').text : html_doc.search('.date-start .annee').text
 m = html_doc.search('.date-start .mois').text.empty? ? francais_chiffre[html_doc.search('.mois').text] : francais_chiffre[html_doc.search('.date-start .mois').text]
 d = html_doc.search('.date-start .date').text.empty? ? html_doc.search('.date').text.first(2) : html_doc.search('.date-start .date').text.first(2)
 a = a.to_i
 m = m.to_i
 d = d.to_i

 a_end = html_doc.search('.date-end .annee').text.empty? ? html_doc.search('.annee').text : html_doc.search('.date-end .annee').text
 m_end = html_doc.search('.date-end .mois').text.empty? ? francais_chiffre[html_doc.search('.mois').text] : francais_chiffre[html_doc.search('.date-end .mois').text]
 d_end = html_doc.search('.date-end .date').text.empty? ? html_doc.search('.date').text.first(2) : html_doc.search('.date-end .date').text.first(2)
 a_end = a_end.to_i
 m_end = m_end.to_i
 d_end = d_end.to_i

results = Geocoder.search("#{html_doc.search('.place').text.gsub(/\n/, "")}, #{departement}")
 (results).empty? ? results = Geocoder.search("France, #{departement}000") : results
results = results.first.coordinates
  # "#{html_doc.search('.place').text.gsub(/\n/, "")}, #{departement}"
catego = html_doc.search('h1').text.split(" ")

 Event.create!({
    name: html_doc.search('h1').text,
    date_start: Date.new(a, m, d),
    date_end: Date.new(a_end, m_end, d_end),
    address: "#{html_doc.search('.place').text.gsub(/\n/, "")}, #{departement}",
    category: catego[0],
#      sub_category:
    photo_url: html_doc.search('.img-polaroid').attribute('src').value,
    lat: results[0],
    long: results[1],
    description:  html_doc.search('.description').text.gsub(/\n/, ""),
    event_url: html_doc.search('.underline').attribute('href').nil? ? "no_url" : html_doc.search('.underline').attribute('href').value
   })

end

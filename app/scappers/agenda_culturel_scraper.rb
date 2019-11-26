require 'open-uri'

class AgendaCulturelScraper
  def initialize(department)
    @department = department
    @url = "https://#{department}.agendaculturel.fr"
  end

  def scrap
    data = events.map do |path|
      url_complete = "#{@url}#{path}"
      html_file = open(url_complete).read
      html_doc = Nokogiri::HTML(html_file)

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

      results = Geocoder.search("#{html_doc.search('.place').text.gsub(/\n/, "")}, #{@department}")
      (results).empty? ? results = Geocoder.search("France, #{@department}000") : results
      results = results.first.coordinates
      # "#{html_doc.search('.place').text.gsub(/\n/, "")}, #{departement}"
      catego = html_doc.search('h1').text.split(" ")


      {
        name: html_doc.search('h1').text,
        date_start: Date.new(a, m, d),
        date_end: Date.new(a_end, m_end, d_end),
        address: "#{html_doc.search('.place').text.gsub(/\n/, "")}, #{@department}",
        category: catego[0],
        #      sub_category:
        photo_url: html_doc.search('.img-polaroid').attribute('src').value,
        lat: results[0],
        long: results[1],
        description:  html_doc.search('.description').text.gsub(/\n/, ""),
        event_url: html_doc.search('.underline').attribute('href').nil? ? "no_url" : html_doc.search('.underline').attribute('href').value
      }
    end
    data.uniq { |e| e[:name] }
  end

  private

  def events
    html_file = open(@url).read
    html_doc = Nokogiri::HTML(html_file)
    html_doc.search('.title-list-event').map do |element|
      element.attribute('href').value
    end
  end

  def francais_chiffre
    {
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
  end
end

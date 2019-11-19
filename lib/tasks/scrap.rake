namespace :scrap do
  task agenda_culturel: :environment do
    events = AgendaCulturelScraper.new(69).scrap

    File.open("#{Rails.root}/db/events.json", 'wb') do |file|
      file.write(events.to_json)
    end
  end
end

namespace :scrap do
  task :agenda_culturel, [:departments] => [:environment] do |t, department|
    events = AgendaCulturelScraper.new(department[:departments]).scrap

    File.open("#{Rails.root}/db/events#{department[:departments]}.json", 'wb') do |file|
      file.write(events.to_json)
    end
  end
end

namespace :scrap do
  task :le_carnet_des_bars => :environment do
    events = LeCarnetDesBarsScraper.new
    events.scrap

    File.open("#{Rails.root}/db/eventsbars.json", 'wb') do |file|
      file.write(events.to_json)
    end
  end
end

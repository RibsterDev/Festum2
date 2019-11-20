namespace :scrap do
  task :agenda_culturel, [:departments] => [:environment] do |t, department|
    events = AgendaCulturelScraper.new(department[:departments]).scrap

    File.open("#{Rails.root}/db/events#{department[:departments]}.json", 'wb') do |file|
      file.write(events.to_json)
    end
  end
end

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Event.create!(name: "Awesome Event!",
                 hashtag: "awesome")
    5.times do |n|
      name = ["Sick Event", "Party of the Year", "SuperJam",
               "Hippest Party Ever", "What What"][n]
      hashtag = ["sick", "poty", "sj",
               "hip", "what"][n]
      Event.create!(name: name,
                    hashtag: hashtag)
    end
  end
end

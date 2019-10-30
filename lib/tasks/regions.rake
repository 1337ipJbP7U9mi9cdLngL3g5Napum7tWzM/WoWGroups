namespace :regions do
  task add: :environment do

    regions = [
      "Americas & Oceania",
      "Europe",
      "Korea",
      "Taiwan"
    ]

    regions.each do |region|
      unless Region.find_by(name: region)
        Region.create(name: region)
      end
    end

  end
end

namespace :hardcodedservers do
  task us: :environment do
    servers = ["Anathema", "Arcanite Reaper", "Arugal", "Ashkandi", "Atiesh", "Azuresong", "Benediction", "Bigglesworth", "Blaumeux", "Bloodsail Buccaneers", "Deviate Delight", "Earthfury", "Faerlina", "Fairbanks", "Felstriker", "Grobbulus", "Heartseeker", "Herod", "Incendius", "Kirtonos", "Kromcrush", "Kurinnaxx", "Loatheb", "Mankrik", "Myzrael", "Netherwind", "Old Blanchy", "Pagle", "Rattlegore", "Remulos", "Skeram", "Smolderweb", "Stalagg", "Sul'thraze", "Sulfuras", "Thalnos", "Thunderfury", "Westfall", "Whitemane", "Windseeker", "Yojamba"]

    servers.each do |server|
      unless Server.exists?(name: server)
        Server.create(name: server, region_id: 1 )
      end
    end
  end

  task eu: :environment do
    servers = ["Amnennar", "Ashbringer", "Auberdine", "Bloodfang", "Celebras", "Chromie", "Dragon's Call", "Dragonfang", "Dreadmist", "Earthshaker", "Everlook", "Finkle", "Firemaw", "Flamegor", "Flamelash", "Gandling", "Gehennas", "Golemagg", "Harbinger of Doom", "Heartstriker", "Hydraxian Waterlords", "Judgement", "Lakeshire", "Lucifron", "Mandokir", "Mirage Raceway", "Mograine", "Nethergarde Keep", "Noggenfogger", "Patchwerk", "Pyrewood Village", "Razorfen", "Razorgore", "Rhok'delar", "Shazzrah", "Skullflame", "Stonespine", "Sulfuron", "Ten Storms", "Transcendence", "Venoxis", "Wyrmthalak", "Zandalar Tribe"]

    servers.each do |server|
      unless Server.exists?(name: server)
        Server.create(name: server, region_id: 2 )
      end
    end
  end

  task kr: :environment do
    servers = ["Hillsbrad", "Iceblood", "Lokholar", "Ragnaros", "Shimmering Flats"]

    servers.each do |server|
      unless Server.exists?(name: server)
        Server.create(name: server, region_id: 3 )
      end
    end
  end

  task tw: :environment do
    servers = ["Ivus", "Maraudon"]

    servers.each do |server|
      unless Server.exists?(name: server)
        Server.create(name: server, region_id: 4 )
      end
    end
  end
end

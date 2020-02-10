namespace :servers do
  task us: :environment do
    require 'watir'

    # "https://worldofwarcraft.com/en-us/game/status/classic-eu",
    # "https://worldofwarcraft.com/en-us/game/status/classic-kr",
    # "https://worldofwarcraft.com/en-us/game/status/classic-tw"
    url = "https://worldofwarcraft.com/en-us/game/status/classic-us"
    regions = Region.all

    browser = Watir::Browser.new(:chrome, {:chromeOptions => {:args => ['--headless', '--window-size=1200x600']}})
    i = 0
    browser.goto(url)
    puts url
    scraped_servers = browser.elements(css: ".Table-body > .Table-row > div:nth-child(2) > span")

    scraped_servers.each do |server|
      puts server.text
      unless Server.exists?(name: server.text)
        Server.create(name: server.text, region_id: 1 )
      end
    end

    i += 1
  end

  task eu: :environment do
    url = "https://worldofwarcraft.com/en-us/game/status/classic-eu"
    regions = Region.all

    browser = Watir::Browser.new(:chrome, {:chromeOptions => {:args => ['--headless', '--window-size=1200x600']}})
    i = 0
    browser.goto(url)
    scraped_servers = browser.elements(css: ".Table-body > .Table-row > div:nth-child(2) > span")

    scraped_servers.each do |server|
      puts server.text
      unless Server.exists?(name: server.text)
        Server.create(name: server.text, region_id: 2 )
      end
    end

    i += 1
  end

  task kr: :environment do
    url = "https://worldofwarcraft.com/en-us/game/status/classic-kr"
    regions = Region.all

    browser = Watir::Browser.new(:chrome, {:chromeOptions => {:args => ['--headless', '--window-size=1200x600']}})
    i = 0
    browser.goto(url)
    scraped_servers = browser.elements(css: ".Table-body > .Table-row > div:nth-child(2) > span")

    scraped_servers.each do |server|
      puts server.text
      unless Server.exists?(name: server.text)
        Server.create(name: server.text, region_id: 3 )
      end
    end

    i += 1
  end

  task tw: :environment do
    url = "https://worldofwarcraft.com/en-us/game/status/classic-tw"
    regions = Region.all

    browser = Watir::Browser.new(:chrome, {:chromeOptions => {:args => ['--headless', '--window-size=1200x600']}})
    i = 0
    browser.goto(url)
    scraped_servers = browser.elements(css: ".Table-body > .Table-row > div:nth-child(2) > span")

    scraped_servers.each do |server|
      puts server.text
      unless Server.exists?(name: server.text)
        Server.create(name: server.text, region_id: 4 )
      end
    end

    i += 1
  end
end

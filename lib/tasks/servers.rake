namespace :servers do
  task add: :environment do
    require 'watir'

    urls = [
      "https://worldofwarcraft.com/en-us/game/status/classic-us",
      "https://worldofwarcraft.com/en-us/game/status/classic-eu",
      "https://worldofwarcraft.com/en-us/game/status/classic-kr",
      "https://worldofwarcraft.com/en-us/game/status/classic-tw"
    ]
    regions = Region.all

    browser = Watir::Browser.new(:chrome, {:chromeOptions => {:args => ['--headless', '--window-size=1200x600']}})
    i = 0
    urls.each do |url|
      browser.goto(url)
      puts url
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
end

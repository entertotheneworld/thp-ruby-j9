require 'nokogiri'
require 'open-uri'


# Récupére l'url de chaque villes => Array of String
def get_deputies_urls
    page = Nokogiri::HTML(URI.open('https://www2.assemblee-nationale.fr/deputes/liste/alphabetique'))
    deputies_urlS_xpath = page.xpath('//a[contains(@href, "deputes")]')

    deputies_urlS = []
    deputies_urlS_xpath.each {|link|
        deputies_urlS << "https://www2.assemblee-nationale.fr" + link["href"]
    }

    return deputies_urlS
end

puts get_deputies_urls
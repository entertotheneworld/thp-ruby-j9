require 'nokogiri'
require 'open-uri'


# Récupére l'url de chaque villes => Array of String
def get_town_hall_urls
    page = Nokogiri::HTML(URI.open('https://www.annuaire-des-mairies.com/val-d-oise.html'))
    town_hall_urlS_xpath = page.xpath('//a[contains(@class, "lientxt")]')

    table_town_hall_urlS = []
    town_hall_urlS_xpath.each {|link|
        table_town_hall_urlS << "https://www.annuaire-des-mairies.com" + link["href"][1..-1]
    }

    return table_town_hall_urlS
end


# Récupére l'email et le nom de la ville => Hash
def get_town_hall_email(town_hall_url)
    page = Nokogiri::HTML(URI.open(town_hall_url))
    town_hall_email = page.xpath('/html/body/div/main/section[2]/div/table/tbody//tr[4]/td[2]')
    town_hall_name = page.xpath('//div[@class="col-md-12 col-lg-10 col-lg-offset-1"]/h1')

    hash_town_hall_email = {}
    town_hall_name.each{ |name|
        town_hall_email.each{ |email|
            hash_town_hall_email[name.text.split[0]] = email.text
        }
    }

    return hash_town_hall_email
end


# Retourne le résultat attendue => Array of Hash
def perform_town_hall
    town_hall_nameS_urlS = []
    get_town_hall_urls.each{ |town_hall_url|
        town_hall_nameS_urlS << get_town_hall_email(town_hall_url)
    }
    
    return town_hall_nameS_urlS
end
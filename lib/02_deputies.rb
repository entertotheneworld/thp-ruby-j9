require 'nokogiri'
require 'open-uri'


# Récupére l'url de chaque député => Array of String
def get_deputies_urls
    page = Nokogiri::HTML(URI.open('https://www2.assemblee-nationale.fr/deputes/liste/alphabetique'))
    deputies_urlS_xpath = page.xpath('//a[contains(@href, "deputes")]')

    deputies_urlS = []
    deputies_urlS_xpath.each {|link|
        deputies_urlS << "https://www2.assemblee-nationale.fr" + link["href"]
    }

    return deputies_urlS
end


# Récupére l'email et le nom de la ville => Hash
def get_deputies_email(deputies_url)
    page = Nokogiri::HTML(URI.open(deputies_url))

    deputies_email = page.xpath('//a[contains(@href, "mailto")]')
    deputies_name = page.xpath('//div[@class="titre-bandeau-bleu clearfix"]/h1')


    hash_deputies_email = {}
    deputies_name.each{ |name|
        deputies_email.each{ |email|
            hash_deputies_email["first_name"] = name.text.split[1]
            hash_deputies_email["last_name"] = name.text.split[2]
            hash_deputies_email["email"] = email.text
        }
    }

    return hash_deputies_email
end


# Retourne le résultat attendue => Array of Hash
def perform_deputies
    deputies_nameS_urlS = []
    get_deputies_urls.each{ |deputies_url|
        deputies_nameS_urlS << get_deputies_email(deputies_url)
    }
    
    return deputies_nameS_urlS
end

puts perform_deputies
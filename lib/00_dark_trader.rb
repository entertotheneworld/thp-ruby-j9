require 'json'
require 'nokogiri'
require 'open-uri'
require 'jsonpath'

# Cette méthode permet de récupérer les 20 premier coins
def crypto_scrapper_method_1
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

  table_coins_values = []

  page.css(".cmc-table-row").each.with_index do |line, index|   
    crypto_name = line.css(".cmc-table__cell--sort-by__symbol").text   
    crypto_price = line.css(".cmc-table__cell--sort-by__price").text 
    table_coins_values[index] = { crypto_name => crypto_price }
  end
  
  table_coins_values.delete_if{|i| i === {""=>""}}

  return table_coins_values

end



# Cette méthode permet de récupérer les 200 premier coins
def crypto_scrapper_method_2
  page = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))
  my_json = JSON.parse(page.css('script[type="application/json"]').first.inner_html)
  infos_coins = my_json["props"]["initialState"]["cryptocurrency"]["listingLatest"]["data"]

  table_coins_values = []

  infos_coins.each{|coin|
    hash_coin_value = {}
    hash_coin_value[coin["symbol"]] = coin["quote"]["USD"]["price"]
    table_coins_values << hash_coin_value
  }

  return table_coins_values
end


# Cette méthode permet de récupérer l'ensemble des coins, mais n'est pas finit car je récupére plus de symbol que de prix
def crypto_scrapper_method_3
  data = (URI.open('https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing?start=1&limit=20000&sortBy=market_cap&sortType=desc&convert=USD&cryptoType=all&tagType=all&audited=false')).read
  symbols_path = JsonPath.new('$..slug')
  prices_path = JsonPath.new('$..price')
  
  symbols =  symbols_path.on(data)
  prices =  prices_path.on(data)
  return Hash[symbols.zip(prices)]

end
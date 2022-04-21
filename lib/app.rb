require "./00_dark_trader.rb"
require "./01_town_hall.rb"



################ Dark Trader

def main_dark_trader
    puts "----------------------------------------------------"
    puts "*********************DARK TRADER*********************"
    puts "----------------------------------------------------"
    tab = ["Méthode 1 = 20 coins","Méthode 2 = 200 coins","Méthode 3 = INFINI coins", "Revenir au menu principal"]
    tab.each_with_index{|val,i| puts "#{i+1}. #{val}"}
    puts "----------------------------------------------------"
    choice = 0
    while choice < 1 || choice > 4
        puts "Votre choix :"
        choice = gets.chomp.to_i
    end
    return choice
end

def perform_main_dark_crypto
    choice = main_dark_trader
    case choice
    when 1
        puts crypto_scrapper_method_1
    when 2
        puts crypto_scrapper_method_2
    when 3
        puts "Le programme n'est pas finit ! Car je récupére plus de symbole que de prix."
        puts "Veuillez patienter, la sélection arrive"
        puts crypto_scrapper_method_3
    when 4
        system('clear')
        return choice
    end
end


################ Mairie Christmas
def main_town_hall
    puts "----------------------------------------------------"
    puts "******************MAIRIE CHRISTMAS******************"
    puts "----------------------------------------------------"
    tab = ["Afficher le résultat","Retour au menu principal"]
    tab.each_with_index{|val,i| puts "#{i+1}. #{val}"}
    puts "----------------------------------------------------"
    choice = 0
    while choice < 1 || choice > 2
        puts "Votre choix :"
        choice = gets.chomp.to_i
    end
    return choice
end

def perform_main_town_hall
    choice = main_town_hall
    case choice
    when 1
        puts perform_town_hall
    when 2
        system('clear')
        return choice
    end
end

################ MAIN
def main 
    puts "----------------------------------------------------"
    puts "*******************MENU PRINCIPAL*******************"
    puts "----------------------------------------------------"
    tab = ["Dark Trader","Mairie christmas","Quittez le programme"]
    tab.each_with_index{|val,i| puts "#{i+1}. #{val}"}
    puts "----------------------------------------------------"
    choice = 0
    while choice < 1 || choice > 3
        puts "Votre choix :"
        choice = gets.chomp.to_i
    end
    return choice
end

def perform
    choice = main
    case choice
    when 1
        system('clear')
        loop do 
            choice = perform_main_dark_crypto
            break if choice == 4
        end

    when 2
        system('clear')
        loop do 
            choice = perform_main_town_hall
            break if choice == 2
        end
    when 3
        puts "À bientôt ! On t'attend pour encore plus d'aventures"
        return choice
    end
end

loop do 
    choice = perform
    break if choice == 3
end
require_relative '../lib/01_town_hall.rb'

describe "get_town_hall_urls" do
    it "should return a array of string" do
        expect(get_town_hall_urls.class).to eq(Array)
        expect(get_town_hall_urls[3].class).to eq(String)
        expect(get_town_hall_urls[5]).to include("https")
        expect(get_town_hall_urls[50]).to include("www.annuaire-des-mairies")
        expect(get_town_hall_urls.size).to eq(185)
        expect(get_town_hall_urls).not_to be_nil
        expect(get_town_hall_urls).not_to be_empty 
    end
end

describe "get_town_hall_email(town_hall_url)" do
    test = "https://www.annuaire-des-mairies.com/95/avernes.html"
    it "should return a Hash" do
        expect(get_town_hall_email(test).class).to eq(Hash)
        expect(get_town_hall_email(test).size).to eq(1)
        expect(get_town_hall_email(test)).not_to be_nil
        expect(get_town_hall_email(test)).not_to be_empty 
        expect(get_town_hall_email("https://www.annuaire-des-mairies.com/95/avernes.html")).to eq({"AVERNES"=>"mairie.avernes@orange.fr"})
        expect(get_town_hall_email("https://www.annuaire-des-mairies.com/95/garges-les-gonesse.html")).to eq({"GARGES-LES-GONESSE"=>"communication@villedegarges.com"})
        expect(get_town_hall_email("https://www.annuaire-des-mairies.com/95/charmont.html")).to eq({"CHARMONT"=>"mairie.charmont@wanadoo.fr"})
    end
end


describe "perform_town_hall" do
    it "should return a Array of Hash" do
        expect(perform_town_hall.class).to eq(Array)
        expect(perform_town_hall[10].class).to eq(Hash)
        expect(perform_town_hall[100].class).to eq(Hash)
        expect(perform_town_hall.size).to eq(185)
        expect(perform_town_hall).not_to be_nil
        expect(perform_town_hall).not_to be_empty 
    end
end
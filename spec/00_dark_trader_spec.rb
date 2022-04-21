require_relative '../lib/00_dark_trader.rb'

describe "crypto_scrapper_method_1" do
  it "should return a array of hash" do
    expect(crypto_scrapper_method_1).not_to be_nil
    expect(crypto_scrapper_method_1).not_to be_empty
    expect(crypto_scrapper_method_1.class).to eq(Array)
    expect(crypto_scrapper_method_1.size).to eq(20)
  end
end

describe "crypto_scrapper_method_2" do
  it "should return a array of hash" do
    expect(crypto_scrapper_method_2).not_to be_nil
    expect(crypto_scrapper_method_2).not_to be_empty
    expect(crypto_scrapper_method_2.class).to eq(Array)
    expect(crypto_scrapper_method_2.size).to eq(200)
  end
end

describe "crypto_scrapper_method_3" do
  it "should return a array of hash" do
    expect(crypto_scrapper_method_3).not_to be_nil
    expect(crypto_scrapper_method_3).not_to be_empty
    expect(crypto_scrapper_method_3.class).to eq(Array)
  end
end

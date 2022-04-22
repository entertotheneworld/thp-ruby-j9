require_relative '../lib/02_deputies.rb'

describe "perform_deputies" do
    it "should return a array of Hash" do
        expect(perform_deputies.class).to eq(Array)
        expect(perform_deputies[3].class).to eq(Hash)
        expect(perform_deputies).not_to be_nil
        expect(perform_deputies).not_to be_empty 
    end
end


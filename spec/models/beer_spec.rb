require "rails_helper"
require "beer"

describe Beer do
	it "should have many beer types" do
		should have_many(:beer_types)
	end
	
	it "should instantiated a Beer" do
		before_count = Beer.count
		beer = Beer.create(beer_style: "Ipa", description: "So good")
		expect(Beer.count).not_to eq(before_count)
	end
end
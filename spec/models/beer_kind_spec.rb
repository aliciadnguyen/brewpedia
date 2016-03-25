require "rails_helper"
require "beer_kind"

describe BeerKind do
	it "should have many beer types" do
		should have_many(:beer_types)
	end
	
	it "should instantiated a Beer" do
		before_count = BeerKind.count
		beer = BeerKind.create(beer_style: "Ipa", description: "So good")
		expect(BeerKind.count).not_to eq(before_count)
	end
end


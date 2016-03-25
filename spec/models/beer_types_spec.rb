require "rails_helper"
require "beer_type"

describe BeerType do
	it "should belong to beer" do
		should belong_to(:beer_kind)
	end

	it "should instantiated a Beer" do
		before_count = BeerType.count
 		beerType = BeerType.create(name: "Boo Koo", 
 							       review: "Tis good", 
 								   appearance: "Delicious", 
 								   smell:  "Great", 
 								   taste: "Fantastic", 
 								   overall: "4.35", 
 								   location: "San Diego", 
 								   brewery: "Pupil", 
 								   beer_kind_id: 1 )
 			
 		expect(BeerType.count).not_to eq(before_count)
	end

	it "should return the correct value when searching query" do
		beerType = BeerType.create(name: "Boo", review: "Good")
		result = BeerType.search("Boo")
		expect(result).to include(beerType)
	end
end
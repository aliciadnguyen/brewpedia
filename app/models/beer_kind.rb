require 'httparty'

class BeerKind < ActiveRecord::Base
	include HTTParty
	API_KEY = '?key=3e89c7e048f2eaa804ed172bc90f50e4'
	base_uri "http://api.brewerydb.com/v2"

	has_many :beers

	def self.save_data_from_api
		response = get('/styles' + API_KEY)
		if response.success?
			b = JSON.parse(response.body)
			for i in 0..response["data"].length-1
				puts b["data"][i]["name"]
				BeerKind.create(beer_style: b["data"][i]["name"]).persisted?
				# self.new(b["data"][i]["name"])
			end
		else
			puts "Error!"
		end
	end
end

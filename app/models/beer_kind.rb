require 'httparty'

class BeerKind < ActiveRecord::Base
	include HTTParty
	API_KEY = '?key=3e89c7e048f2eaa804ed172bc90f50e4'
	base_uri "http://api.brewerydb.com/v2"

	has_many :beers

	def self.cached_request
		# Rails.cache.fetch "beers", :expires_in => 5.minutes do
			
		# end
	end

	def self.save_data_from_api
		response = get('/styles' + API_KEY)
		if response.success?
			b = JSON.parse(response.body)
			for i in 0..response["data"].length-1
				name = b["data"][i]["name"]
				id = b["data"][i]["id"]
				description = b["data"][i]["description"]
				if !BeerKind.exists?(['beer_style iLIKE ?', name])
					BeerKind.create(beer_style: name, description: description)
				else
					puts "Already Made"
					return
				end
			end
		else
			puts "Error!"
		end
	end

	def self.make_beers(id) 
		response = get('/beers' + API_KEY + "&styleId=" + id.to_s)
		if response.success?
			b = JSON.parse(response.body)
			if b["data"].is_a?(Array)
				for index in 0..b["data"].length-1
					name = b["data"][index]["name"]
					abv = b["data"][index]["abv"].to_f
					description = b["data"][index]["description"]
					Beer.create(beer_kind_id: id, appearance: description, name: name, abv: abv) if !Beer.exists?(['name iLIKE ?', name])
				end
			elsif b["data"].is_a?(Hash)
				name = b["data"]["name"]
				abv = b["data"][index]["abv"].to_f
				description = b["data"]["description"]
				Beer.create(beer_kind_id: id, appearance: description, name: name, abv: abv) if !Beer.exists?(['name iLIKE ?', name])
			end
		else
			puts "Error!"
		end
	end

end

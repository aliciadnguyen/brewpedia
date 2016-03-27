require 'httparty'
class Brewery
	include HTTParty
	API_KEY = '?key=3e89c7e048f2eaa804ed172bc90f50e4'
	base_uri "http://api.brewerydb.com/v2"

	attr_accessor :beer_style

	def initialize (beer_style)
		self.beer_style = beer_style
	end

	def versions
		response = self.class.get('/beers' + API_KEY + '/styleId=57')
		if response.success?
			response
		else
			raise response.response
		end
	end

	def self.find(id)
		response = get('/beers' + API_KEY + '&styleId=' + id.to_s)
		if response.success?
			b = JSON.parse(response.body)
			for i in 0..response["data"].length-1
				puts b["data"][i]["name"]
				self.new(b["data"][i]["name"])
			end
		else
			puts "Error!"
		end
	end

end
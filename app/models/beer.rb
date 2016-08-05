require 'httparty'

class Beer < ActiveRecord::Base
	include HTTParty
	API_KEY = '?key=3e89c7e048f2eaa804ed172bc90f50e4'
	base_uri "http://api.brewerydb.com/v2"

	belongs_to :beer_kind

	def self.search(term)
		where("name iLIKE ? OR review iLIKE ?", "%#{term}%",  "%#{term}%")
	end

	#  def self.make_beers(id) 
	#  	puts id
	# 	response = get('/beers' + API_KEY + "&styleId=" + id.to_s)
	# 	puts response.request.last_uri.to_s
	# 	if response.success?
	# 		b = JSON.parse(response.body)
	# 		if b["data"].is_a?(Array)
	# 			for index in 0..b["data"].length-1
	# 				id = b["data"][index]["id"]
	# 				puts id.to_s
	# 				name = b["data"][index]["name"]
	# 				puts "NAME IS: " + name
	# 				description = b["data"][index]["description"]
	# 				Beer.create(beer_kind_id: id, appearance: description, name: name) if !Beer.exists?(['name iLIKE ?', name])
	# 			end
	# 		elsif b["data"].is_a?(Hash)
	# 			name = b["data"]["name"]
	# 			puts "HASH"
	# 			puts "HASH NAME IS: " + name
	# 			description = b["data"]["description"]
	# 			Beer.create(beer_kind_id: id, appearance: description, name: name) if !Beer.exists?(['name iLIKE ?', name])
	# 		end
	# 	else
	# 		puts "Error!"
	# 	end
	# end

end

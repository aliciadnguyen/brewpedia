task :fetch_beer => :environment do
	require 'rubygems'
	require 'nokogiri'
	require 'open-uri'

	url = "http://www.beeradvocate.com/beer/style/150/"
	doc = Nokogiri::HTML(open(url))
	dataSet = []

	doc.css("table tr"). each do |b|
		beer = {}
		name = b.css("td:first-child a b").text
		brewery = b.css("td:nth-child(2) a").text
		abv = b.css("td:nth-child(3) span").text
		rating = b.css("td:nth-child(4) b").text

		if !name.empty?
			beer[:name] = name 
			beer[:brewery] = brewery 
			beer[:abv] = abv 
			beer[:rating] = rating 
			beer[:beer_kind_id] = 1
			dataSet.push(beer)
		else
			next
		end
	end

	dataSet.each do |d|
		puts d.inspect
	end
end
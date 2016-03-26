require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = "http://www.beeradvocate.com/beer/style/150/"
doc = Nokogiri::HTML(open(url))

def extract(html, css_name)
	set = []
	html.css(css_name).each do |beer|
		set << {
			:row => beer.css("a b").text
		}
	end
	set
end

name = extract(doc, "table td:first-child")
name.each do |n|
	if !n[:row].empty?
		# puts n[:row].inspect, "\n" 
	end
end
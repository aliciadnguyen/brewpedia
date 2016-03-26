require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = "http://www.beeradvocate.com/beer/style/150/"
doc = Nokogiri::HTML(open(url))

puts doc.at_css("title").text

class BeerKindsController < ApplicationController
	def index
		@beer_kinds = BeerKind.all
	end

	def show
		@find_beer = BeerKind.find(params[:id])
		@beers = @find_beer.beers
		@api_beers = BeerKind.save_data_from_api

		if params[:search]
			@beers = @find_beer.beers.search(params[:search])
		else
			@beers = @find_beer.beers
		end
	end
end

class BeerKindsController < ApplicationController
	def index
		@beers = BeerKind.all
	end

	def show
		@find_beer = BeerKind.find(params[:id])
		@beer_types = @find_beer.beer_types

		if params[:search]
			@beer_types = @find_beer.beer_types.search(params[:search])
		else
			@beer_types = @find_beer.beer_types
		end
	end
end

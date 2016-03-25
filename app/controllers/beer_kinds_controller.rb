class BeerKindsController < ApplicationController
	def index
		@beers = BeerKind.all
	end

	def show
		@find_beer = BeerKind.find(params[:id])
		@beers = @find_beer.beers

		if params[:search]
			@beers = @find_beer.beers.search(params[:search])
		else
			@beers = @find_beer.beers
		end
	end
end

class BeersController < ApplicationController
	def index
		@beers = Beer.all
	end

	def show
		@beer = Beer.find(params[:id])
		@beer_types = @beer.beer_types

		if params[:search]
			@beer_types = @beer.beer_types.search(params[:search])
		else
			@beer_types = @beer.beer_types
		end
	end
end

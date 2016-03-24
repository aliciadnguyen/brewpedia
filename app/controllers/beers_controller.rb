class BeersController < ApplicationController
	def index
		@beers = Beer.all
	end

	def show
		@beer = Beer.find(params[:id])
		@beer_types = BeerType.all

		if params[:search]
			@beer_types = BeerType.where("name LIKE ?", "%#{params[:search]}%")
		else
			@beer_types = BeerType.all
		end
	end
end

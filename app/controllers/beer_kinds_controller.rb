class BeerKindsController < ApplicationController

	# before_action :require_user, only: [:index, :show]

	def index
		BeerKind.save_data_from_api
		@beer_kinds = BeerKind.all.order(:beer_style)

		if params[:search]
			@beers = Beer.search(params[:search])
		end
	end

	def show
		BeerKind.make_beers(params[:id])
		@find_beer = BeerKind.find(params[:id])
		@beers = @find_beer.beers

		if params[:search]
			@beers = @find_beer.beers.search(params[:search])
		else
			@beers = @find_beer.beers
		end
	end
end

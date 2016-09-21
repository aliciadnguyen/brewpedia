class BeersController < ApplicationController
	
	before_action :require_user, only: [:new, :show, :edit, :create, :update]

	def new
		@beer = Beer.new
	end

	def show
		@beer = Beer.find(params[:id])

	end

	def index
		if params[:search]
			@beers = Beer.search(params[:search])
		end
	end

	def edit
		@beer = Beer.find(params[:id])
	end

	def create
		@beer = Beer.new(beer_params)
		if @beer.save
			redirect_to beer_kind_path(@beer.beer_kind_id)
		else
			render "new"
		end
	end

	def update
		@beer = Beer.find(params[:id])
		if @beer.update(beer_params)
			redirect_to beer_kind_path(@beer.beer_kind_id)
		else
			render 'edit'
		end
	end

	private
		def beer_params
			params.require(:beer).permit(:name, :abv, :review, :appearance, :smell, :taste, :overall, :location, :brewery, :beer_kind_id)
		end
end
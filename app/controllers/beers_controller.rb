class BeersController < ApplicationController
	def new
		@beer = Beer.new
	end

	def show
		@beer = Beer.find(params[:id])
	end

	def edit
		@beer = Beer.find(params[:id])
	end

	def create
		@beer = Beer.new(beer_params)
		if @beer.save
			redirect_to root_path
		else
			render "new"
		end
	end

	def update
		@beer = Beer.find(params[:id])
		if @beer.update(beer_params)
			redirect_to root_path
		else
			render 'edit'
		end
	end

	private
		def beer_params
			params.require(:beer).permit(:name, :review, :appearance, :smell, :taste, :overall, :location, :brewery, :beer_kind_id)
		end
end
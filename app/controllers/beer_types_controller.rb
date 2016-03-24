class BeerTypesController < ApplicationController
	def new
		@beer_type = BeerType.new
	end

	def show
		@beer_type = BeerType.find(params[:id])
	end

	def edit
		@beer_type = BeerType.find(params[:id])
	end

	def create
		@beer_type = BeerType.new(beer_type_params)
		if @beer_type.save
			redirect_to root_path
		else
			render "new"
		end
	end

	def update
		@beer_type = BeerType.find(params[:id])
		if @beer_type.update(beer_type_params)
			redirect_to root_path
		else
			render 'edit'
		end
	end

	private
		def beer_type_params
			params.require(:beer_type).permit(:name, :review, :appearance, :smell, :taste, :overall, :location, :brewery, :beer_id)
		end
end
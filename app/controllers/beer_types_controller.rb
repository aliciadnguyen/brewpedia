class BeerTypesController < ApplicationController
	before_action :set_beer, only: [:show, :edit, :update]

	def new
		@beer_type = BeerType.new
	end

	def show
	end

	def edit
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
		if (@beer_type.update_attribute(beer_type_params))
			redirect_to root_path
		else
			flash[:note] = 'Error!'
			render 'edit'
		end
	end

	private
		def beer_type_params
			params.require(:beer_type).permit(:name, :review, :appearance, :smell, :taste, :overall, :location, :brewery, :beer_id)
		end

		def set_beer
			@beer_type = BeerType.find(params[:id])
		end
end
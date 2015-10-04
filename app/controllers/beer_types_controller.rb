class BeerTypesController < ApplicationController
	def show
		@beer_type = BeerType.find(params[:id])
	end

	def edit
		@beer_type = BeerType.find(params[:id])
	end

	def update
		@beer_type = BeerType.find(params[:id])
		if @beer_type.update(beer_type_params)
			redirect_to @beer_type
		else
			render 'edit'
		end
	end

	private
		def beer_type_params
			params.require(:beer_type).permit(:appearance, :smell, :taste, :overall, :beer_id)
		end
	end
end

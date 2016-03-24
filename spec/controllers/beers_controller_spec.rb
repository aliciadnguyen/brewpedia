require 'rails_helper'

RSpec.describe BeersController, :type => :controller do 
	describe "GET #index" do 
		it "responds successfully with HTTP 200 status code" do 
			get :index
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "renders the index template" do 
			get :index
			expect(response).to render_template("index")
		end

		it "populates all the beer types" do 
			beer1, beer2 = Beer.create!, Beer.create!
			get :index
			expect(assigns(:beers)).to match_array([beer1, beer2])
		end
	end

	describe "GET #show" do
		before {
			@beer1 = Beer.create!
		}
		it "responds successfully with HTTP 200 status code" do
			get :show, id: @beer1
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "renders the show template" do 
			get :show, id: @beer1
			expect(response).to render_template("show")
		end
	end
end
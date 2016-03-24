require 'rails_helper'
require 'beer_type'

RSpec.describe BeerTypesController, :type => :controller do 
	describe "GET #new" do 
		it "responds successfully with HTTP 200 status code" do 
			get :new
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "renders the new template" do 
			get :new
			expect(response).to render_template("new")
		end

		it "asigns a non created beer to the view" do
			get :new
			expect(assigns(:beer_type)).to be_a_new(BeerType)
		end
	end

	describe "POST #create" do
		it "it should save a beer create by user and redirect to index page" do 
			post :new
			before_count = BeerType.count
			post :create, :beer_type => { :name  =>"Boo Koo", 
							     :review => "Tis good", 
								 :appearance => "Delicious", 
								 :smell => "Great", 
								 :taste => "Fantastic", 
								 :overall => "4.35", 
								 :location => "San Diego", 
								 :brewery => "Pupil", 
								 :beer_id => 1 }
			
			expect(BeerType.count).not_to eq(before_count)
			expect(response).to redirect_to(root_path)
		end
	end

	describe "GET #edit" do
		it "should route get request #edit as" do
			should route(:get, '/beer_types/1/edit').to(action: :edit, id: 1)
		end
	end

	describe "PUT #update" do
		it "should route put request #update as" do
			should route(:put, '/beer_types/1').to(action: :update, id: 1)
		end
	end

	describe "DELETE #destroy" do
		it "should route delete request #destroy as" do
			should route(:delete, '/beer_types/1').to(action: :destroy, id: 1)
		end
	end
end
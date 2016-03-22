require 'rails_helper'

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
	end

	describe "POST #new" do
		it "it should save a beer create by user" do 
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
		end
	end
end

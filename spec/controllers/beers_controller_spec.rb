require 'rails_helper'
require 'beer'

RSpec.describe BeersController, :type => :controller do 
	let!(:beer) { Beer.create( :name  =>"Boo Koo", 
							   :review => "Tis good", 
							   :appearance => "Delicious", 
							   :smell => "Great", 
							   :taste => "Fantastic", 
						       :overall => "4.35", 
							   :location => "San Diego", 
							   :brewery => "Pupil", 
							   :beer_kind_id => 1 ) }
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
			expect(assigns(:beer)).to be_a_new(Beer)
		end
	end

	describe "POST #create" do
		it "it should save a beer create by user and redirect to index page" do 
			post :new
			before_count = Beer.count
			post :create, :beer => { :name  =>"Boo Koo", 
							     	 :review => "Tis good", 
								 	 :appearance => "Delicious", 
								 	 :smell => "Great", 
								 	 :taste => "Fantastic", 
								 	 :overall => "4.35", 
								 	 :location => "San Diego", 
								 	 :brewery => "Pupil", 
								 	 :beer_kind_id => 1 }
			
			expect(Beer.count).not_to eq(before_count)
			expect(response).to redirect_to('/beer_kind/1')
		end
	end

	describe 'GET #show' do
		before { get :show, :id => beer.id }

		it 'assigns @beer' do
			expect(assigns(:beer)).to eq(beer)
		end

		it 'renders the show template' do
			expect(response).to render_template("show")
		end
	end

	describe "GET #edit" do
		before { get :edit, :id => beer.id }

		it 'assigns @beer' do
			expect(assigns(:beer)).to eq(beer)
		end

		it 'renders the show template' do
			expect(response).to render_template("edit")
		end

		it "should route get request #edit as" do
			should route(:get, '/beers/1/edit').to(action: :edit, id: 1)
		end
	end

	describe "PATCH #update" do
		before { 
			patch :update, :id => beer.to_param, :beer => { :name  =>"Update Boo Koo" } 
			beer.reload
		}

		it 'assigns @beer' do
			expect(assigns(:beer)).to eq(beer)
		end

		it 'renders the show template' do
			expect(response).to redirect_to('/beer_kind/1')
		end

		it 'updates the name of beer' do
			expect(beer.name).to eq 'Update Boo Koo'
		end

		it "should route put request #update as" do
			should route(:patch, '/beers/1').to(action: :update, id: 1)
		end
	end
end
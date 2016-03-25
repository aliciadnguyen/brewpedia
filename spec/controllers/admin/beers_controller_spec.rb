require 'rails_helper'
include Devise::TestHelpers

describe Admin::BeersController, type: :controller do
	render_views

	let(:admin_user) { AdminUser.create( email: 'admin@example.com',
										 password: 'password' ) }

	let(:beer) { Beer.create( beer_kind_id: 1,
							  name: 'Hoppy',
							  appearance: 'Gold Hues',
							  smell: 'Smoky',
							  taste: 'Slighty Bitter',
							  overall: '2',
							  location: 'San Diego',
							  brewery: 'Societe' ) }

	before(:each) do
		sign_in admin_user
	end

	describe 'create' do
		it 'makes a new beer kind' do
			post :create, newBeer: { beer_kind_id: 1,
									  name: 'Two Hearted Ale',
									  appearance: 'Gold Hues',
									  smell: 'Smoky',
									  taste: 'Slighty Bitter',
									  overall: '2',
									  location: 'San Diego',
									  brewery: 'Societe' }
			expect(Beer.all.count).to eq(1)
		end
	end

	describe 'edit' do
		it 'renders beer kind form' do
			get :edit, id: beer.to_param
			expect(assigns(:beer)).to eq beer
		end
	end

	describe 'update' do
		it 'updates user' do
			patch :update, { id: beer.to_param, 
							 beer: { name: 'The Pupil' } }
			beer.reload
			expect(beer.name).to eq 'The Pupil'
		end
	end
end
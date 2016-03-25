require 'rails_helper'
include Devise::TestHelpers

describe Admin::BeerKindsController, type: :controller do
	render_views

	let(:admin_user) { AdminUser.create( email: 'admin@example.com',
										 password: 'password' ) }

	let(:beer_kind) { BeerKind.create( beer_style: 'Larger',
									   description: 'So good' ) }

	before(:each) do
		sign_in admin_user
	end

	describe 'create' do
		it 'makes a new beer kind' do
			post :create, newBeer: { beer_style: 'Larger',
									 description: 'So good' }
			expect(BeerKind.all.count).to eq(1)
		end
	end

	describe 'edit' do
		it 'renders beer kind form' do
			get :edit, id: beer_kind.to_param
			expect(assigns(:beer_kind)).to eq beer_kind
		end
	end

	describe 'update' do
		it 'updates user' do
			patch :update, { id: beer_kind.to_param, 
							 beer_kind: { beer_style: 'IPA' } }
			beer_kind.reload
			expect(beer_kind.beer_style).to eq 'IPA'
		end
	end
end
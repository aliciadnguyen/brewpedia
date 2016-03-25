require 'rails_helper'
include Devise::TestHelpers

describe Admin::AdminUsersController, type: :controller do
	render_views

	let(:admin_user) { AdminUser.create( email: 'admin@example.com',
										 password: 'password' ) }
	before(:each) do
		sign_in admin_user
	end

	describe 'create' do
		it 'makes a new admin user' do
			post :create, newUser: { email: 'admin@example.com',
									 password: 'password' }
			expect(AdminUser.all.count).to eq(1)
		end
	end

	describe 'edit' do
		it 'renders user form' do
			get :edit, id: admin_user.to_param
			expect(assigns(:admin_user)).to eq admin_user
		end
	end

	describe 'update' do
		it 'updates user' do
			patch :update, { id: admin_user.to_param, 
							 admin_user: { email: 'new@example.com' } }
			admin_user.reload
			expect(admin_user.email).to eq 'new@example.com'
		end
	end
end
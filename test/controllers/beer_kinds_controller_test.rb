require 'spec_helper'

RSpec.describe BeerKindController, :type => :controller do 
	describe "GET #index" do 
		it "populates all the beer types" do 
			get :index
			expect(response).to be_success
		end
		
	end
end

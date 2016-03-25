class BeerKind < ActiveRecord::Base
	has_many :beer_types
end

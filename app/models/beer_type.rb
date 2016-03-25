class BeerType < ActiveRecord::Base
	belongs_to :beer

	def self.search(term)
		where("name iLIKE ? OR review iLIKE ?", "%#{term}%",  "%#{term}%")
	end
end

class Beer < ActiveRecord::Base
	belongs_to :beer_kind

	def self.search(term)
		where("name iLIKE ? OR review iLIKE ?", "%#{term}%",  "%#{term}%")
	end
end

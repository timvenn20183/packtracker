class Region < ActiveRecord::Base

	versioned

	belongs_to :country
	has_many :districts

end

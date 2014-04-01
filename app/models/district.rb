class District < ActiveRecord::Base

	versioned

	belongs_to :region

end

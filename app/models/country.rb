class Country < ActiveRecord::Base

	versioned

	has_many :regions

end

class Attendancetype < ActiveRecord::Base

	versioned

	has_many :attendancetypes

end

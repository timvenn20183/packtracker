class Patrol < ActiveRecord::Base

	versioned

	has_many :recruits

end
